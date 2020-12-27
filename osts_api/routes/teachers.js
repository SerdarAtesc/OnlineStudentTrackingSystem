const { response } = require('express');
var express = require('express');
var router = express.Router();

router.post('/Add', function (req, res, next) {
    var postParams = req.body;
    var querryParams = [
      postParams.name,// ad
      postParams.lastname, // soyad
      postParams.mail,
      postParams.phone,
      postParams.detail,//1 2 3 4 5 6 7 8
      postParams.username, // giriş adı
      postParams.password // giriş şifresi
    ]
    console.log(postParams);
    var sqlQuerry = 'CALL SP_TEACHER_ADD(?,?,?,?,?,?,?)';
    db.query(sqlQuerry, querryParams, function (err, results) {
      if (err) {
        res.json("database error")
        console.log(err);
        return;
      }
      try {
        if (results["0"].length>0) {
  
          res.send(JSON.stringify(1));
          return;
        } else {
          res.json(0);
          return;
        }
      } catch (ex) {
        res.json(-1);
        return;
      }
    });
  
  });

  module.exports = router;
