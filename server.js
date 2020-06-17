var mysql = require('mysql');
var express = require('express');

// server functions
const app = express();
app.listen('3000', () => {
  console.log('server started!');
});
app.use(express.static('public'));
app.use(express.json());

// query handling
app.post('/sqlhandle', async (request, response)=>{
  const sql = request.body.sql;
  con.query(sql, (err, res) => {
    if (err) console.log(err);
    console.log(res);
    response.json(res);
  });
});

// database functions
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "anna",
  database: "acnh"
});

con.connect((err) => {
  if (err) {console.log('mySQL not connected');}
  console.log("Connected!");
});