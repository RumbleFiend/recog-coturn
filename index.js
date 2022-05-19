var express = require("express");
var app = express();
<<<<<<< HEAD
app.listen(8080, () => {
  console.log("Server running on port 3000");
});
//api
=======
app.listen(3000, () => {
  console.log("Server running on port 3000");
});

>>>>>>> 395ee706848925c29d32dcf84bcd53e453632b1c
app.get("/", (req, res, next) => {
  res.json(["Tony", "Lisa", "Michael", "Ginger", "Food"]);
});
