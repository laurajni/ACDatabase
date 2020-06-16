
document.getElementById("display user").innerHTML = "Hi! " + localStorage.getItem('user');

const delbtn = document.getElementById("delbtn");

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