// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require('jquery/dist/jquery.min')

require('uikit/dist/js/uikit-core.min')
require('uikit/dist/js/uikit-icons.min')
require('uikit/dist/js/uikit.min')
require('uikit/dist/css/uikit.min.css')

require('@fortawesome/fontawesome-free/js/all')
require('@fortawesome/fontawesome-free/css/all.min.css')

require('chart.js/dist/Chart.min')
require('chart.js/dist/Chart.bundle.min')
require('chart.js/dist/Chart.min.css')

require('bootstrap/dist/js/bootstrap.min')
require('bootstrap/dist/css/bootstrap.min.css')
require('summernote/dist/summernote-bs4.min.css')
require('chart.js/dist/Chart.min.css')
require('@yaireo/tagify/src/tagify.scss')
import 'uikit/dist/js/uikit.min';


import './quiz';
import './tag';
import './question_select';
import './chart';
import './chart_tab';
import './add_priority_form';
import './switch_schedule_table';
import './question_image_file';
import './summernote';
import '../stylesheet/application.scss';


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
