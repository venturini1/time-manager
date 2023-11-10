// const { defineConfig } = require('@vue/cli-service')
// module.exports = defineConfig({
//   transpileDependencies: true
// })
module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
    ? '/time-manager/'
    : '/',
    proxy: 'http://13.36.64.65:8080/',
  
}
