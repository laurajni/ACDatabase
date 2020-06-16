const sqlbtn = document.getElementById('sub');

const signupbtn = document.getElementById('signupbtn');

const loginbtn = document.getElementById('loginbtn');

var user = null;

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

sqlbtn.addEventListener("click", async ()=>{
    const input = document.getElementById('id?');
    const sql = input.value;
    try {
        let res = await query(sql);
        console.log(res);
    } catch (err) {
        console.log(err);
    }
});

signupbtn.addEventListener("click", async ()=>{
    const input = document.getElementById("Sign up");
    const username = input.value;
    const sql = "select user_name from my_user where user_name = \"" + username + "\"";    
    try {
        let res = await query(sql);
        if (res.length==0) {
            console.log("empty");
            location.href='main.html';
            addNewUser(username);
        } else {
            alert("user name taken");
        }
    } catch (err) {
        console.log(err);
    }
});

async function addNewUser(username) {
    const sql = "insert into my_user(user_name) values(\""+ username +"\")";
    try {
        await query(sql);
    } catch (err) {
        console.log(err);
    }
}

loginbtn.addEventListener("click", async ()=>{
    const input = document.getElementById("Log in");
    const username = input.value;
    const sql = "select user_name from my_user where user_name = \"" + username + "\"";
    try {
        let res = await query(sql);
        if (res.length==0) {
            alert("can't find user");
        } else {
            location.href='main.html';
            user = username;
        }
    } catch (err) {
        console.log(err);
    }
});