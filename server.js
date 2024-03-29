// Generated by CoffeeScript 1.3.3
(function() {
  var app, express, port, routes;

  express = require('express');

  routes = require('./routes');

  app = module.exports = express.createServer();

  if (process.argv.length > 2) {
    port = parseInt(process.argv[2]);
  }

  if (port == null) {
    port = 8000;
  }

  app.configure(function() {
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(app.router);
    app.use(express.compiler({
      src: __dirname + '/public',
      enable: ['less']
    }));
    return app.use(express["static"](__dirname + '/public'));
  });

  app.configure('development', function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });

  app.configure('production', function() {
    return app.use(express.errorHandler());
  });

  app.get('/', routes.index);

  app.listen(port);

  console.log("Express server listening on port %d", app.address().port);

}).call(this);
