({
    shim: {
        'jquery-ui': {
            deps: ['jquery']
        }
    },
    paths: {
        'jquery': '../lib/jquery-1.9.1',
        'jquery-ui': '../lib/jquery-ui-1.10.1'
    },

    baseUrl: ".",
    name: "../lib/almond",
    include: "main",
    out: "../main.js",
    wrap: true
})