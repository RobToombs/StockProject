const path = require('path');
const merge = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common ,{
    mode: 'development',
    entry: [
        `webpack-dev-server/client?http://localhost:9000`,
        path.join(__dirname, 'static/index.js')
    ],
    devServer: {
        historyApiFallback: true,
        contentBase: './src',
        hot: true,
        port: 9000,
        proxy: {
            "/": {
                target: `http://localhost:8080`,
                changeOrigin: true
            }
        }
    }
});