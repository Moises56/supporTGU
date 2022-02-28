// app/javascript/packs/application.js

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require bootstrap
//= require sb-admin-2.min

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("custom/sb-admin-2")


const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// top of packs/application.js

const importAll = (r) => r.keys().map(r)

importAll(require.context('../images', false, /\.(png|jpe?g|svg)$/));