import glob from 'glob';
import path from 'path';
import webpack from 'webpack';
import ManifestPlugin from 'webpack-manifest-plugin';
import VueLoaderPlugin from 'vue-loader/lib/plugin';

const target_directory = path.join(__dirname, 'src');
const targets = glob.sync(path.join(target_directory, '**/*.{js,ts,vue}'));
const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin')
const entries = targets.reduce((entries, target_path) => {
  const target_file_name = path.relative(target_directory, target_path);
  const target_file_extention = path.extname(target_file_name);

  return {
    ...entries,
    [target_file_name.replace(
      target_file_extention,
      ''
    )]: `./frontend/src/${target_file_name}`
  };
}, {});

export default {
  devtool: 'inline-source-map',
  mode: 'development',
  entry: entries,
  module: {
    rules: [
      {
        test: /\.ts$/,
        exclude: /node_modules/,
        use: {
          loader: 'ts-loader',
          options: {
            appendTsSuffixTo: [/\.vue$/]
          }
        }
      },
      {
        test: /\.js?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true,
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.vue$/,
        exclude: /node_modules/,
        use: {
          loader: 'vue-loader'
        }
      },
      {
        test: /\.s(c|a)ss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            loader: 'sass-loader',
            options: {
              implementation: require('sass'),
              sassOptions: {
                fiber: require('fibers'),
              }
            }
          }
        ]
      },
      {
        test: /\.css/,
        use: [
          {
            loader: 'style-loader'
          },
          {
            loader: 'css-loader',
            options: {
              url: false,
              sourceMap: true
            }
          }
        ]
      },
    ]
  },

  output: {
    path: path.join(__dirname, '../..', 'public/webpack'),
    filename: '[name]-bundle-[hash].js',
    publicPath: 'https://musiq-quiz-generator.herokuapp.com/'
  },

  resolve: {
    extensions: ['.js', '.ts', 'vue'],
    alias: {
      vue$: 'vue/dist/vue.esm.js'
    },
  },

  plugins: [
    new VueLoaderPlugin(),
    new webpack.HotModuleReplacementPlugin({
      multiStep: false
    }),
    new ManifestPlugin({
      fileName: 'manifest.json',
      writeToFileEmit: true
    }),
    new VuetifyLoaderPlugin()
  ],

  devServer: {
    port: 1212,
    host: '0.0.0.0',
    publicPath: 'http://0.0.0.0:1212/',
    inline: true,
    lazy: false,
    hot: true,
    overlay: true,
    quiet: false,
    headers: { 'Access-Control-Allow-Origin': '*' },
    contentBase: path.join(__dirname, '../', 'public/webpack'),
    watchOptions: {
      aggregateTimeout: 300,
      ignored: /node_modules/,
      poll: 100
    }
  }
};
