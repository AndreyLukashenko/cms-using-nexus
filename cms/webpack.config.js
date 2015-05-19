module.exports = {
  entry: './scripts/index.coffee',
  output: {
    path: './dist',
    filename: 'bundle.js'
  },
  devtool: 'source-map',
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' }
    ]
  }
};
