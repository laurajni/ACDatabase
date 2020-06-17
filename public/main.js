

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
const pricebtn = document.getElementById("listprice");
const seriesbtn = document.getElementById("seriesbtn");
const addbtn = document.getElementById("addlist");

let tab = "";

var mainTable = new Tabulator("#bb", {
    autoColumns: true,
    rowDblClick: function(e,row){
        // add item to selected list
        if (confirm("add to current list?")) {
            const select = listTable.getSelectedData();
            console.log(select);
            if (select.length==0) alert("you need to choose a list");
            else if (tab!="item") alert("only support item");
            else {
                const listId = select[0].wishlist_id;
                const sql = "insert into wishlist_item values(\""+listId+"\",\""
                +row._row.data.item_id+"\")";
                query(sql);
            }
        }
    }
});

itembtn.addEventListener("click", ()=> {loadTable("item")});
npcbtn.addEventListener("click", ()=> {loadTable("npc")});
eventbtn.addEventListener("click", ()=> {loadTable("sp_event")});
recipebtn.addEventListener("click", ()=> {loadTable("diy_recipe")});

async function loadTable(table) {
    tab=table;
    const sql = "select * from "+table;
    let res = await query(sql);
    mainTable.setData(res);
}



addbtn.addEventListener("click", ()=>{
    var inputname = prompt("enter list name:");
    if (inputname!=null) {
        const sql = "INSERT INTO wishlist (wishlist_name, user_id) VALUES (\""+inputname+"\")";
        query(sql);
        listTable.addData([{wishlist_name: inputname}]);
        showList();
    }
});



showList();

async function showList() {
    const sql = "select wishlist_name, wishlist_id from wishlist where user_id in (select user_id"
    +" from my_user where user_name = \""+user+"\")";
    try {
        let res = await query(sql);
        console.log(res);
        listTable.updateOrAddData(res);
    } catch(err) {
        console.log(err);
    }
}

var listTable = new Tabulator("#ss", {
    headerVisible: false,
    selectable: 1,
    columns: [
        {title: "wishlist_name", field: "wishlist_name", width: "200"}
    ],
    rowClick: function(e,row){
        displayListTable(row._row.data.wishlist_id);
    },
    rowContextMenu: function(e,row){
        if (confirm("delet this list?")) {
            const listid = row._row.data.wishlist_id;
            row.delete().then(()=>{
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
    +"JOIN wishlist_item ON item.item_id = wishlist_item.item_id INNER JOIN wishlist"
    +" ON wishlist.wishlist_id = "+listid+" AND wishlist.wishlist_id = wishlist_item.list_id;"
    try {
        let res = await query(sql);
        console.log(res);
        mainTable.setData(res);
    } catch(err) {
        console.log(err);
    }
}

const searchbtn = document.getElementById("searchbtn");

searchbtn.addEventListener("click", async ()=>{
    if (tab=="") {
        alert("choose a tab to search in");
        return;
    }
    let res = await search();
    mainTable.setData(res);
});

async function search() {
    const input = document.getElementById("searchbar");
    const name = input.value;
    let field = tab+"_name";

    if (tab=="sp_event") field="event_name";
    else if (tab=="diy_recipe") field="diy_name";

    const sql = "select * from " + tab + " where " + field +" LIKE \"\%"+name+"\%\"";
    try {
       let res = await query(sql);
       return res;
    } catch(err) {
        console.log(err);
    }
}

async function query(sql) {
    return new Promise((resolve, reject)=>{
        const data = {sql};
        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        };

        fetch('/sqlhandle', options).then((response)=>{
            return response.json();
        }).then((json)=>{
            resolve(json);
        }).catch((err)=>{
            reject(err);
        });
    });

}

delbtn.addEventListener("click", ()=>{
    var conf = confirm('Are you sure you want to delete your account?'
        +' This will include all your wishlists');
    if (conf) {
        window.location = 'index.html';
        query("delete from my_user where user_name = \"" + localStorage.getItem('user') + "\"");
    }
});

//TODO
dellistbtn.addEventListener("click", ()=>{
    var conf = confirm('Are you sure you want to delete your wishlist?');
});

//TODO
renamebtn.addEventListener("click", ()=>{

});

//TODO
//JOIN wishlist_item and item
detailsbtn.addEventListener("click", ()=>{

});

//TODO
//JOIN npc table and wishlist items
villagersbtn.addEventListener("click", ()=>{

});

//TODO
//JOIN wishlist items & craftable items & diy recipe & materials needed then group by materials and count materials
materialsbtn.addEventListener("click", ()=>{

});

//TODO
//group by sell price and display somewhere and count total price
pricebtn.addEventListener("click", ()=>{

});

//TODO
seriesbtn.addEventListener("click", ()=>{

});