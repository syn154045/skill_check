// 開発or本番モードの選択(development、production、noneのいずれか設定必須)
// development: 開発時のファイル出力のモード(最適化より時間短縮,エラー表示などを優先)
// production: 本番時のファイル出力のモード(最適化されて出力される)
const MODE = "development";
// ソースマップの利用有無(productionのときはソースマップを利用しない)
const enabledSourceMap = MODE === "development";

// ファイル出力時の絶対パス指定に使用
const path = require('path');
const webpack = require('webpack');

//
// Plugins
//
const HtmlWebpackPlugin = require('html-webpack-plugin');
const VueLoaderPlugin   = require('vue-loader/lib/plugin');

module.exports = {
  mode: 'development',
  // chrome dev console での警告表示を消すために設定
  devtool: "eval-source-map",
  // エントリーポイント(メインのjsファイル)
  entry: './main.js',
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new HtmlWebpackPlugin({
      template: "./index.html"
    }),
    // Vueを読み込めるようにするため
    new VueLoaderPlugin(),
  ],
  output: {
    // 出力先(絶対パスでの指定必須)
    path: path.resolve(__dirname, 'dist'),
    // 出力ファイル名
    filename: 'main.js',
    clean: true,
  },
  module: {
    rules: [{
      test: /\.css$/,
      use: [{
        loader: 'vue-style-loader',
      }, {
        loader: 'css-loader',
      }],
    }, {
      test: /\.vue$/,
      loader: "vue-loader"
    }, {
      // ローダーの対象 // 拡張子 .js の場合
      test: /\.js$/,
      // ローダーの処理対象から外すディレクトリ
      exclude: /node_modules/,
    }],
  },
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js',
    },
    // require 時に省略する拡張子
    extensions: ['.js', '.vue', '.css', ' '],
  },
  devServer: {
    // 同一 network 内からのアクセス可能に
    host: '0.0.0.0',
    port: 3035,
    client: {
      webSocketURL: 'ws://localhost:3035/ws',
    },
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
    // バンドルされるファイルの監視 // パスがサーバー起点と異なる場合に設定
    static: {
      directory: path.resolve(__dirname, "./dist"),
    },
  },
}
