var express = require('express');
var router = express.Router();
var mysql = require('mysql')
var models = require('../../sql/db')
var $sql = require('../../sql/sqlMap')

var connection = mysql.createConnection(models.mysql)
connection.connect()
// 登录验证语句
var sql = $sql.user.getProfile

router.get('/:sno', function(req, res, next) {
  var sno = req.params.sno
  connection.query(sql, [sno], (err, result) => {
    if(err) {
      console.log(err)
      return
    }
    console.log(result)
    res.send({
      result
    })
  })
});

module.exports = router;
