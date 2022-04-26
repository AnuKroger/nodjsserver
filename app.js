var fs = require('fs'),
    http = require('http');

http.createServer(function (req, res) {
  if(req.url == "/"){
    req.url="/index.html"
  }
  fs.readFile(__dirname +"/htmls"+ req.url, function (err, data) {
    console.log(req.url);
      if (err) {
        res.writeHead(404);
        res.end(JSON.stringify(err));
        return;
      }
      res.writeHead(200);
      res.end(data);
    });
}).listen(8080);

