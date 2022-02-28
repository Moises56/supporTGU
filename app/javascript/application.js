// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "packs"

//= require sb-admin-2.min

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// top of packs/application.js

const importAll = (r) => r.keys().map(r)

importAll(require.context('../images', false, /\.(png|jpe?g|svg)$/));