// const fs = require('fs');
const express = require('express');
// const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;

const config = require('./database_config.json');
const mysql = require('mysql');
const { json } = require('express/lib/response');
const pool =mysql.createPool(config);

app.use(express.json());

app.post('/user',(req,res)=>{

    const uid = req.body.uid;
    const password =req.body.password;
    var sql = "SELECT uid FROM user WHERE uid = ? AND password =?";
    pool.query(sql,[uid,password], (err,results,fields)=>{
        if(err){
            console.log(err);
            res.json({
                cmd:502,
                err:err
            });
        }else{  
            console.log("작동");
            res.json(results);
        }
    })

});


app.listen (port, () => console.log(`${port}`));