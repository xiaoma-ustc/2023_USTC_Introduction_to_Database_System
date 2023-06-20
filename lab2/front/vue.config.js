// 设置项目名称别名
module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        // 存放图像,css等资源
        'assets': '@/assets',
        // 公共的js文件
        'common': '@/common',
        // 公共组件
        'components': '@/components',
        // 网络请求
        'network': '@/network',
        // 页面
        'views': '@/views'
      }
    },
    //更改默认端口
    devServer: {
        open: false, // 自动打开浏览器
        port: 8081,
    },
  }
}