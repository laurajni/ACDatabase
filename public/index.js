const btn = document.getElementById('sub');

btn.addEventListener("click", ()=>{
    const input = document.getElementById('id?');
    const sql = input.value;
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
        console.log(json);
    }).catch((err)=>{
        console.log(err);
    });
});