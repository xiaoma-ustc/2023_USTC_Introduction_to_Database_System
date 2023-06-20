var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.user.getAllGrade

router.get('/', function(req, res, next) {
  const sno = req.query.sno
  connection.query(sql, [sno], (err, result) => {
    if(err) {
      console.log(err)
      return
    }
    console.log(sno)
    res.send({
      result
    })
  })
});

module.exports = router;
