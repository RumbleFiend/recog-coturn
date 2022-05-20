var express = require("express");
var shell = require("shelljs");

var app = express();

app.listen(process.env.PORT || 8080, () => {
  console.log("Server running on port 8080");
});
//api
app.get("/", (req, res, next) => {
  res.send("<h1>COTURN SERVER GTTFO</h1>");
});
shell.exec("./start_coturn.sh");
