const path = require("path")

module.exports = {
  target: 'node',
  entry: {
    demo: "./src/demo.js"
  },
  output: {
    path: path.join(__dirname, "lib", "bundledOutputs"),
    filename: "[name].js"
  },
}
