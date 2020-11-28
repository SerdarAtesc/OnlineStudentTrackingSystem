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
    postParams.title,// Ödev başlığı
    postParams.detail, // detayı
    postParams.assignerid, // atayan öğretmen id'si cookieden alınabilir
    postParams.lectureid,// ders id'si
    postParams.studentid] // atanan öğrenci id'si

  var sqlQuerry = 'CALL SP_HOMEWORK_ASSIGN(?,?,?,?,?)';
  db.query(sqlQuerry, querryParams, function (err, results) {
    if (err) {
      console.log(err.message);
      res.json("database error")
      return;
    }
    try {
      if (results["0"].length>0) {
        res.json(true);

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

  let sqlQuerry = `CALL SP_HOMEWORK_DELETE(?)`;
  let querryParams = [id];
  try {
    db.query(sqlQuerry, querryParams, function (err, results,fields) {
      if(results.affectedRows>0)
      {
        console.log('A Homework has deleted');
        res.json(true);
      }
      else
        res.json(false);
    });
  }
  catch (err){
    console.log("error while deleting a Homework."+err.message);
    res.json(-1);
  }


});

router.post('/Publish', function (req, res, next) {
  var postParams = req.body;
  var querryParams = [
    postParams.homeworkid,
    postParams.publisherid,
    postParams.detailid,
    0,
    ""]

  var sqlQuerry = 'CALL SP_HOMEWORK_PUBLISH(?,?,?,?,?)';
  db.query(sqlQuerry, querryParams, function (err, results) {
    if (err) {
      res.json("database error")
      return;
    }
    try {
      if (results["0"].length>0) {
        res.json(true);
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


router.get('/studentHomeworkList/:studentid', function (req, res, next) {
  var getParams = req.params.studentid;
  var sqlQuerry = 'CALL SP_STUDENT_HOMEWORK_LIST(?)';
  db.query(sqlQuerry, getParams, function (err, results) {
    try {
      res.json(results[0]);
      console.log("homework has sent");
      return;
    } catch (ex) {
      res.json(-1);
      return;
    }
  });

});


router.get('/teacherHomeworkList/:teacherid', function (req, res, next) {
  var getParams = req.params.teacherid;
  var sqlQuerry = 'CALL SP_TEACHER_HOMEWORK_LIST(?)';
 
  db.query(sqlQuerry, getParams, function (err, results) {
    try {
    
      res.json(results[0]);
      console.log('homeworks has sent');
      return;
    } catch (ex) {
      
      res.json(-1);
      return;
    }
  });

});







module.exports = router;
