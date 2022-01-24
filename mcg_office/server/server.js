

const express = require('express') 
const connection = require('./database');
const app = express()

//db연결
connection.connect();

app.post('/user', (req, res) => {

    //var userid = req.body.userid;

    var sql ="SELECT * FROM USER;"
    connection.query(sql,),
        function (error,result,fields) {
            if(error) {
                res.send('error')
            }
            else {
                res.send('Hello World!')  
            }
        }
  })
  
  app.listen(5000)