var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.user.addCourse

router.post('/', function(req, res, next) {
  var sno = req.body.sno
  var cno = req.body.cno
  console.log(req.body)
  connection.query(sql, [sno, cno], (err, result) => {
    if(err) {
      console.log('???')
      console.log(err)
      return
    }
    res.send({
      status: 1105,
      message: '选课成功！'
    })
  })
});

module.exports = router;
