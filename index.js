var express = require("express");
var shell = require("shelljs");

var app = express();
app.listen(8080, () => {
  console.log("Server running on port 3000");
});
//api
app.get("/", (req, res, next) => {
  res.json(["Tony", "Lisa", "Michael", "Ginger", "Food"]);
});

shell.exec("./start_coturn.sh");
