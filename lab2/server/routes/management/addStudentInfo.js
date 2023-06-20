var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.superUser.addStudentInfo

router.post('/', function(req, res,next) {
    var sno = req.body.sno
    var sname = req.body.name
    var sex = req.body.sex
    var sage = req.body.age
    var admi_date = req.body.admi_date
    var school = req.body.school
    var sdept = req.body.major
    var email = req.body.email
    var tel = req.body.tel
    var hobby = req.body.hobby
    var intro = req.body.intro
    connection.query(sql, [sno,sname, sex, sage, admi_date, school, sdept, null, null, null, null, null, null], (err, result) => {
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
