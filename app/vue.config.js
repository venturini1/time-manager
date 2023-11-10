// const { defineConfig } = require('@vue/cli-service')
// module.exports = defineConfig({
//   transpileDependencies: true
// })
module.exports = {
  devServer: {
    proxy: 'http://13.36.64.65:8080/',
    },
  publicPath: process.env.NODE_ENV === 'production'
    ? '/time-manager/'
    : '/'
}
