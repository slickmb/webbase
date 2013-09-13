/*globals require*/

require.config({
    shim: {
        'jquery-ui': {
            deps: ['jquery'],
            exports: 'jQuery'
        }
    },
    paths: {
        'jquery': '../lib/jquery-1.9.1',
        'jquery-ui': '../lib/jquery-ui-1.10.1'
    },
    baseUrl: '/js/require'

});

require([], function () {
    'use strict';
    if (window._localScripts) {
        while(_localScripts.length > 0) { _localScripts.shift()(); }
    }
});