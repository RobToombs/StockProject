const path = require('path');
const merge = require('webpack-merge');
const common = require('./webpack.common.js');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

module.exports = merge(common ,{
    mode: 'production',
    entry: path.join(__dirname, 'static/index.js'),
    optimization: {
        minimizer: [
            new UglifyJsPlugin({
                uglifyOptions: {
                    minimize:true,
                    compress: {},
                    mangle:true
                }
            })
        ]
    }
});