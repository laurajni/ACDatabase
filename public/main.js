

let user = localStorage.getItem('user');

document.getElementById("display user").innerHTML = "Hi! " + user;

const delbtn = document.getElementById("delbtn");

const itembtn = document.getElementById("itembtn");
const npcbtn = document.getElementById("npcbtn");
const eventbtn = document.getElementById("eventbtn");
const recipebtn = document.getElementById("recipebtn");

let tab = "";

itembtn.addEventListener("click", ()=>{ tab="item" });
npcbtn.addEventListener("click", ()=>{ tab="npc" });
eventbtn.addEventListener("click", ()=>{ tab="sp_event" });
recipebtn.addEventListener("click", ()=>{ tab="diy_recipe" });



showList();

async function showList() {
    const sql = "select * from wishlist where user_id in (select user_id"
    +" from my_user where user_name = \""+user+"\")";
    try {
        let res = await query(sql);
        displayList(res);
    } catch(err) {
        console.log(err);
    }
}

// function displayList(res) {
//     var table = new Tabulator("#ss", {
//         data: res,
//         headerVisible: false,
//         columns: [
//             {title: "wishlist_name", field: "wishlist_name", width: "200"}
//         ],
//         rowDblClick: function(e,row){
//             displayListTable(row._row.data.wishlist_id);
//         },
//         rowContextMenu: function(e,row){
//             if (confirm("delet this list?")) {
//                 // delete row
//                 const listid = row._row.data.wishlist_id;
//                 row.delete().then(()=>{
//                     const sql = "delete from wishlist where wishlist_id = \"" 
//                     + listid + "\"";
//                     query(sql);
//                 });
//             }
//         },
//         rowClick: function(e,row){row.select();}
//     });
// }
var listTable = new Tabulator("#ss", {
    headerVisible: false,
    columns: [
        {title: "wishlist_name", field: "wishlist_name", width: "200"}
    ],
    rowDblClick: function(e,row){
        displayListTable(row._row.data.wishlist_id);
    },
    rowContextMenu: function(e,row){
        if (confirm("delete this list?")) {
            // delete row
            const listid = row._row.data.wishlist_id;
            row.delete().then(()=>{
                const sql = "delete from wishlist where wishlist_id = \"" 
                + listid + "\"";
                query(sql);
            });
        }
    },
    rowClick: function(e,row){row.select();}
});

function displayList(res) {
    listTable.updateOrAddData(res);
}

function displayListTable(listid) {
    console.log(listid);
    // join wish_item & item table
    const sql = ""
}


const searchbtn = document.getElementById("searchbtn");

searchbtn.addEventListener("click", async ()=>{
    if (tab=="") {
        alert("choose a tab to search in");
        return;
    }
    let res = await search();
    displayTable(res);
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

function displayTable(res) {
    var table = new Tabulator("#resultTable", {
        data: res,
        autoColumns: true,
        rowDblClick: function(e,row){
            // add item to selected list
            if (confirm("add to current list?")) {
                const select = listTable.getSelectedData();
                console.log(select);
                if (select.length==0) alert("you need to choose a list");
                else {
                    const listId = select[0].wishlist_id;
                    const sql = "insert into wishlist_item values(\""+listId+"\",\""
                    +row._row.data.item_id+"\")";
                    query(sql);
                }
            }
        }
    });
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
        location.href='index.html';
        query("delete from my_user where user_name = \"" + localStorage.getItem('user') + "\"");
    }
});