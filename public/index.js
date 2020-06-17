const sqlbtn = document.getElementById('sub');
const signupbtn = document.getElementById('signupbtn');
const loginbtn = document.getElementById('loginbtn');

localStorage.setItem('user', null);

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

sqlbtn.addEventListener("click", async () => {
    const input = document.getElementById('id?');
    const sql = input.value;
    if (sql.length == 0) {
        alert("empty input!!");
        return;
    }
    try {
        let res = await query(sql);
        console.log(res);
    } catch (err) {
        console.log(err);
    }
});

signupbtn.addEventListener("click", async () => {
    const input = document.getElementById("Sign up");
    const username = input.value;
    if (username.length == 0) {
        alert("empty input!!");
        return;
    }
    const sql = "select user_name from my_user where user_name = \"" + username + "\"";
    try {
        let res = await query(sql);
        if (res.length == 0) {
            location.href = 'main.html';
            addNewUser(username);
            localStorage.setItem('user', username);
        } else {
            alert("user name taken");
        }
    } catch (err) {
        console.log(err);
    }
});

async function addNewUser(username) {
    const sql = "insert into my_user(user_name) values(\"" + username + "\")";
    try {
        await query(sql);
    } catch (err) {
        console.log(err);
    }
}

loginbtn.addEventListener("click", async () => {
    const input = document.getElementById("Log in");
    const username = input.value;
    if (username.length == 0) {
        alert("empty input!!");
        return;
    }
    const sql = "select user_name from my_user where user_name = \"" + username + "\"";
    try {
        let res = await query(sql);
        if (res.length == 0) {
            alert("can't find user");
        } else {
            location.href = 'main.html';
            localStorage.setItem('user', username);
        }
    } catch (err) {
        console.log(err);
    }
});