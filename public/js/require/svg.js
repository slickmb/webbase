/*jslint browser: true */
/*globals define, $ */

define(['jquery'], function ($) {
    'use strict';

    var ready = $.Deferred();

    $(document).ready(function () {
        ready.resolve();
    });

    function loadSVG(url, selector, css) {

        $.when($.ajax({
            type: "GET",
            url: url,
            dataType: "html"
        }), ready).then(function (data) {
            data = data[0];

            var $el = $(data);

            if (css) {
                $el.attr(css);
            }

            $el.appendTo(selector);
        });

    }

    return loadSVG;




});
