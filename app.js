var http = require('http');
var formidable = require('formidable');
var fs = require('fs');

http.createServer(function (req, res) {
  if (req.url == '/fileupload') {
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
      var oldpath = files.filetoupload.filepath;
      var newpath = __dirname + files.filetoupload.originalFilename;
      res.write('File uploaded and moved!');
      res.end();
    });
  } else {
    if (req.url == "/") {
      req.url = "/index.html"
    }
    fs.readFile(__dirname + "/htmls" + req.url, function (err, data) {
      console.log(req.url);
      if (err) {
        res.writeHead(404);
        res.end(JSON.stringify(err));
        return;
      }
      res.writeHead(200);
      res.end(data);
    });

  }
}).listen(8080);
