var express = require("express");
var shell = require("shelljs");

var app = express();

app.listen(process.env.PORT || 8080, () => {
  console.log("Server running on port 8080");
  shell.echo("Server running on port 8080 ");
  shell.exec("./start_coturn.sh");
});

//api
app.get("/", (req, res, next) => {
  return res.send("<h1>COTURN SERVER GTTFO</h1>");
});
