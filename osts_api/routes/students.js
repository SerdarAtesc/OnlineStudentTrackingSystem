const { response } = require('express');
var express = require('express');
var router = express.Router();


router.get('/List/:classid', function (req, res, next) {
  var getParams = req.params.classid;
  var sqlQuerry = 'CALL SP_SHOW_STUDENTS(?)';
  db.query(sqlQuerry, getParams, function (err, results) {
    try {
     res.json(results[0]);
     console.log("students has sent");
     return;
    } catch (ex) {
      res.json(-1);
      return;
    }
  });

});

router.post('/Add', function (req, res, next) {
  var postParams = req.body;
  var querryParams = [
    postParams.name,// ad
    postParams.lastname, // soyad
    postParams.mail,
    postParams.phone,
    postParams.class,//1 2 3 4 5 6 7 8
    postParams.username, // giriş adı
    postParams.password,
    postParams.code // giriş şifresi
  ]
  console.log(postParams);
  var sqlQuerry = 'CALL SP_STUDENT_ADD(?,?,?,?,?,?,?,?)';
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

router.post('/Update', function (req, res, next) {
  var postParams = req.body;
  var querryParams = [
    postParams.id,// ad
    postParams.username, // giriş adı
    postParams.password, // giriş şifresi
    postParams.mail,
    postParams.phone
  ]

  var sqlQuerry = 'CALL SP_STUDENT_UPDATE(?,?,?,?,?)';
  db.query(sqlQuerry, querryParams, function (err, results) {
    if (err) {
      res.json("database error")
      return;
    }
    try {
      if (results.affectedRows>0) {
        res.json(results[0]);
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
router.post('/UpdatePassword', function (req, res, next) {
  var postParams = req.body;
  var querryParams = [
    postParams.username, // giriş adı
    postParams.password, // giriş şifresi
    postParams.mail,
    postParams.code
  ]
  var sqlQuerry = 'CALL SP_PASSWORD_UPDATE(?,?,?,?)';
  console.log(postParams);
  db.query(sqlQuerry, querryParams, function (err, results) {
    if (err) {
      res.json("database error")
      console.log(err);
      return;
    }
    try {
      if (results.affectedRows>0) {
        res.json(results[0]);
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

router.delete('/Delete/:id',function (req,res,next) {
  var id=req.params.id;

  let sqlQuerry = `CALL SP_STUDENT_DELETE(?)`;
  let querryParams = [id];
  try {
    db.query(sqlQuerry, querryParams, function (err, results,fields) {
      if(results.affectedRows>0)
      {
        console.log('A student has deleted');
       res.json(true);
      }
      else
        res.json(false);
    });
  }
  catch (err){
    console.log("error while deleting a student."+err.message);
    res.json(-1);
  }


});

module.exports = router;
