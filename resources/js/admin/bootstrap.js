import axios from 'axios';
import Vue from 'vue';
import jQuery from 'jquery';

window.$ = window.jQuery = jQuery;
window.Vue = Vue;
window.axios = axios;

let token = document.head.querySelector('meta[name="csrf-token"]');
if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
    let ajaxSettings = {
        'cache': false,
        "async": true,
        "crossDomain": true
    }
    $.ajaxSetup(ajaxSettings);
}
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
