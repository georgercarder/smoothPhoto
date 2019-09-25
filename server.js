var express = require("express");
var app = express();
const port = 4000;

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.get("/target*", (req, res) => {
  console.log(req.originalUrl);
  var idx = req.originalUrl.replace("/target", "");
  res.sendFile(__dirname + "/sortedTarget/target" + idx + ".jpg");
});

app.listen(port, (err) => {
  if (err) console.error(err);
  console.log("app listening on " + port);
});

