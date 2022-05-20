var express = require("express");

var app = express();

app.listen(process.env.PORT || 8080, () => {
  console.log("Server running on port 8080");
});
//api
app.get("/", (req, res, next) => {
  res.send("<h1>COTURN SERVER GTTFO</h1>");
});

var spawn = require("child_process").spawn;
spawn("./start_coturn.sh", [], {
  stdio: "ignore",
  detached: true,
}).unref();
