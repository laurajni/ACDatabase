let user = localStorage.getItem('user');

document.getElementById("display user").innerHTML = "Hi " + user + "!";

const delbtn = document.getElementById("delbtn");
const itembtn = document.getElementById("itembtn");
const npcbtn = document.getElementById("npcbtn");
const eventbtn = document.getElementById("eventbtn");
const recipebtn = document.getElementById("recipebtn");
const renamebtn = document.getElementById("renamelist");
const dellistbtn = document.getElementById("deletelist");
const detailsbtn = document.getElementById("listdetails");
const villagersbtn = document.getElementById("listvillagers");
const materialsbtn = document.getElementById("listmaterials");
const totalmaterialsbtn = document.getElementById("listtotalmaterials");
const totalitemsbtn = document.getElementById("listtotalitems");
const seriesbtn = document.getElementById("seriesbtn");
const addbtn = document.getElementById("addlist");

const commonbtn = document.getElementById("listcommon");

const pricebelowbtn = document.getElementById("pricebelow");

pricebelowbtn.addEventListener("click", async () => {
    var price = prompt("enter a price:");
    if (price == null) return;
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "select * from item where item.sell_price < "
        + price + " AND item.item_id in(select item_id from wishlist_item where wishlist_item.list_id = "
        + listId + " AND item.item_id = wishlist_item.item_id);";
    let res = await query(sql);
    mainTable.setData(res);
})


let tab = "";

var mainTable = new Tabulator("#bb", {
    autoColumns: true,
    rowDblClick: function (e, row) {
        // add item to selected list
        if (confirm("add to current list?")) {
            const select = listTable.getSelectedData();
            console.log(select);
            if (select.length == 0) alert("you need to choose a list");
            else if (tab !== "item") alert("only support item");
            else {
                const listId = select[0].wishlist_id;
                const sql = "insert into wishlist_item values(\"" + listId + "\",\""
                    + row._row.data.item_id + "\")";
                query(sql);
            }
        }
    }
});

itembtn.addEventListener("click", () => {
    loadTable("item")
});
npcbtn.addEventListener("click", () => {
    loadTable("npc")
});
eventbtn.addEventListener("click", () => {
    loadTable("sp_event")
});
recipebtn.addEventListener("click", () => {
    loadTable("diy_recipe")
});
seriesbtn.addEventListener("click", () => {
    loadTable("item_series")
});


async function loadTable(table) {
    tab = table;
    const sql = "select * from " + table;
    let res = await query(sql);
    mainTable.setData(res);
}


addbtn.addEventListener("click", async () => {
    var inputname = prompt("enter list name:");
    if (inputname != null) {
        const userIdsql = "select user_id from my_user where user_name = \"" + user + "\"";
        let res = await query(userIdsql);
        console.log(res);
        let userid = res[0].user_id;
        const sql = "INSERT INTO wishlist (wishlist_name, user_id)"
            + " VALUES (\"" + inputname + "\",\"" + userid + "\")";
        await query(sql);
        showList();
    }
});


showList();

async function showList() {
    const sql = "select wishlist_name, wishlist_id from wishlist where user_id in (select user_id"
        + " from my_user where user_name = \"" + user + "\")";
    try {
        let res = await query(sql);
        listTable.setData(res);
    } catch (err) {
        console.log(err);
    }
}

var listTable = new Tabulator("#ss", {
    headerVisible: false,
    selectable: 1,
    columns: [
        {title: "wishlist_name", field: "wishlist_name", width: "200"}
    ],
    rowClick: function (e, row) {
        displayListTable(row._row.data.wishlist_id);
    },
    rowContextMenu: function (e, row) {
        if (confirm("delet this list?")) {
            const listid = row._row.data.wishlist_id;
            row.delete().then(() => {
                const sql = "delete from wishlist where wishlist_id = \""
                    + listid + "\"";
                query(sql);
            });
        }
    },
});

async function displayListTable(listid) {
    console.log(listid);
    // join wish_item & item table
    const sql = "SELECT item.item_name, item.obtains, item.sell_price FROM item "
        + "JOIN wishlist_item ON item.item_id = wishlist_item.item_id INNER JOIN wishlist"
        + " ON wishlist.wishlist_id = " + listid + " AND wishlist.wishlist_id = wishlist_item.list_id;";
    try {
        let res = await query(sql);
        console.log(res);
        mainTable.setData(res);
    } catch (err) {
        console.log(err);
    }
}

const searchbtn = document.getElementById("searchbtn");

searchbtn.addEventListener("click", async () => {
    if (tab == "") {
        alert("choose a tab to search in");
        return;
    }
    let res = await search();
    mainTable.setData(res);
});

async function search() {
    const input = document.getElementById("searchbar");
    const name = input.value;
    let field = tab + "_name";

    if (tab == "sp_event") field = "event_name";
    else if (tab == "diy_recipe") field = "diy_name";

    let sql = "select * from " + tab + " where " + field + " LIKE \"\%" + name + "\%\"";

    if (tab == "item") {
        console.log(document.getElementById("radioCheckbox"));
        let kind = getRadio(document.getElementById("radioCheckbox"), "itemtype");
        if (kind == "allitembtn") {
            let attr = getFields();
            sql = "select " + attr + " from " + tab + " where " + field + " LIKE \"\%" + name + "\%\"";
        } else if (kind == "crittersbtn") {
            sql = "select * from item inner join critter on critter.critter_id = item.item_id;";
        } else if (kind == "furnitbn") {
            sql = "select * from item inner join furniture on furniture.furniture_id = item.item_id;";
        } else if (kind == "clothingbtn") {
            sql = "select * from item inner join clothing on clothing.clothing_id = item.item_id;";
        } else if (kind == "craftablebtn") {
            sql = "select * from item inner join craftable_item on craftable_item.item_id = item.item_id;";
        } else if (kind == "buyablebtn") {
            sql = "select * from item inner join buyable_item on buyable_item.item_id = item.item_id;";
        }
    }

    try {
        return await query(sql);
    } catch (err) {
        console.log(err);
    }
}

function getRadio(form, name) {
    var res;
    var radios = form.elements[name];
    for (var i = 0; i < radios.length; ++i) {
        if (radios[i].checked) {
            res = radios[i].id;
            break;
        }
    }
    return res;
}

function getFields() {
    let sql = [];
    sql.push("item_name");
    const itemidbox = document.getElementById("itemidbox");
    const itemobtainsbox = document.getElementById("itemobtainsbox");
    const itemsizebox = document.getElementById("itemsizebox");
    const itemseriesbox = document.getElementById("itemseriesbox");
    const itemsellbox = document.getElementById("itemsellbox");
    if (itemidbox.checked) {
        sql.push("item_id");
    }
    if (itemobtainsbox.checked) {
        sql.push("obtains");
    }
    if (itemsizebox.checked) {
        sql.push("item_size");
    }
    if (itemseriesbox.checked) {
        sql.push("item_series_id");
    }
    if (itemsellbox.checked) {
        sql.push("sell_price");
    }
    return sql.join(",");
}

async function query(sql) {
    return new Promise((resolve, reject) => {
        const data = {sql};
        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        };

        fetch('/sqlhandle', options).then((response) => {
            return response.json();
        }).then((json) => {
            resolve(json);
        }).catch((err) => {
            reject(err);
        });
    });

}

delbtn.addEventListener("click", () => {
    var conf = confirm('Are you sure you want to delete your account?'
        + ' This will include all your wishlists');
    if (conf) {
        window.location = 'index.html';
        query("delete from my_user where user_name = \"" + localStorage.getItem('user') + "\"");
    }
});

dellistbtn.addEventListener("click", async () => {
    if (!confirm('Are you sure you want to delete your wishlist?')) return;
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to rename");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "delete from wishlist where wishlist_id = \"" + listId + "\"";
    await query(sql);
    showList();
});

renamebtn.addEventListener("click", async () => {
    var name = prompt("enter new list name:");
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to rename");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "update wishlist set wishlist_name = \"" + name + "\" where wishlist_id = \"" + listId + "\"";
    await query(sql);
    showList();
});

commonbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    const userIdsql = "select user_id from my_user where user_name = \"" + user + "\"";
    let userIdTemp = await query(userIdsql);
    let userid = userIdTemp[0].user_id;
    let sql = "SELECT DISTINCT * from item i WHERE NOT EXISTS (select * FROM wishlist w WHERE w.user_id = "
        + userid + " AND NOT EXISTS (SELECT wi.item_id FROM wishlist_item wi WHERE w.wishlist_id " +
        "= wi.list_id AND wi.item_id = i.item_id));";
    let res = await query(sql);
    mainTable.setData(res);
});

//JOIN wishlist_item and item
detailsbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "SELECT * FROM item "
        + "JOIN wishlist_item ON item.item_id = wishlist_item.item_id INNER JOIN wishlist"
        + " ON wishlist.wishlist_id = " + listId + " AND wishlist.wishlist_id = wishlist_item.list_id;";
    let res = await query(sql);
    mainTable.setData(res);
});

//JOIN npc table and wishlist items
villagersbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "select i.item_id, wl.wishlist_name, i.item_name, i.obtains, g.note, n.npc_name from item i "
        + "join craftable_item c on c.item_id = i.item_id "
        + "join npc_gift g on c.diy_id = g.diy_id "
        + "join npc n on n.npc_id = g.npc_id "
        + "join wishlist_item ON i.item_id = wishlist_item.item_id "
        + "JOIN wishlist wl ON wl.user_id = " + listId + " AND wl.wishlist_id = wishlist_item.list_id;";
    let res = await query(sql);
    mainTable.setData(res);
});

//JOIN wishlist items & craftable items & diy recipe & materials needed then group by materials and count materials
materialsbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "select i.item_name AS Creaftable, i.obtains, mi.item_name, u.quantity from item i "
        + "join craftable_item c on c.item_id = i.item_id "
        + "join diy_recipe_uses_item u on u.diy_id = c.diy_id "
        + "join item mi on u.item_id = mi.item_id "
        + "join wishlist_item on i.item_id = wishlist_item.item_id "
        + "AND wishlist_item.list_id = " + listId + ";";
    let res = await query(sql);
    mainTable.setData(res);
});

//group by sell price and display somewhere and count total price
totalmaterialsbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "select  mi.item_name, sum(quantity)from item i "
        + "join craftable_item c on c.item_id = i.item_id "
        + "join diy_recipe_uses_item u on u.diy_id = c.diy_id "
        + "join item mi on u.item_id = mi.item_id "
        + "join wishlist_item on i.item_id = wishlist_item.item_id "
        + "AND wishlist_item.list_id = " + listId + " "
        + "GROUP BY (mi.item_name);";
    let res = await query(sql);
    mainTable.setData(res);
});

totalitemsbtn.addEventListener("click", async () => {
    let selected = listTable.getSelectedRows();
    console.log(selected);
    if (selected.length == 0) {
        alert("choose a list to project");
        return;
    }
    let listId = selected[0]._row.data.wishlist_id;
    let sql = "SELECT COUNT(*) FROM item JOIN wishlist_item"
        + " ON item.item_id = wishlist_item.item_id AND wishlist_item.list_id = " + listId + ";";
    let res = await query(sql);
    mainTable.setData(res);
})
