var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.superUser.getAllTeacherInfo

router.get('/', function(req, res, next) {
  console.log('????')
  connection.query(sql, (err, result) => {
    if(err) {
      console.log(err)
      return
    }
    res.send({
      result
    })
  })
})

module.exports = router;

