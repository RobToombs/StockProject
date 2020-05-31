const path = require('path');
const merge = require('webpack-merge');
const common = require('./webpack.common.js');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

const outputPath = path.join(__dirname, 'web/html');

module.exports = merge(common ,{
    mode: 'production',
    entry: path.join(__dirname, 'static/index.js'),
    output: {
        path: outputPath,
        filename: 'index_bundle.js'
    },
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