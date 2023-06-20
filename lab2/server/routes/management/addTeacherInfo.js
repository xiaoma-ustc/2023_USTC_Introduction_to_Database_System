var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.superUser.addTeacherInfo

router.post('/', function(req, res,next) {
    var tno = req.body.tno
  var name = req.body.name
  var sex = req.body.sex
  var age = req.body.age
  var school = req.body.school
  var email = req.body.email
  var tel = req.body.tel
  var intro = req.body.intro
  connection.query(sql, [tno,name, sex, age,  school,null,null,null,null,null], (err, result) => {
    if(err) {
      console.log(err)
      res.send({
        status: 1100,
        message: '课程增加失败'
      })
      return
    }
    
    res.send({
      status: 1105,
      message: '课程增加成功'
    })
  })
});

module.exports = router;
