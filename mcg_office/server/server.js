

const express = require('express') 
const connection = require('./database');
const app = express()

//db연결
connection.connect();

// api post 
app.post('/user', (req, res) => {
    var uid = req.body.userid;
    var password = req.body.password;
    //var userid = req.body.userid;

    var sql ="SELECT 'uid' FROM USER WHERE uid = ? AND password = ?;"
    connection.query(sql), // 쿼리작동
        function (error,result,fields) { // 결과는 result에 담김.
            if(error) {
                res.send('error'); //에러발생시 에러 출력
            }
            else {
                res.send(result);   
            }
        }
  })
  
  app.listen(5000)