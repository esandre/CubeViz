express = require("express")
app = express()

app.use( express.static(__dirname + "/client", {
  index: "index.html"
}))

app.listen(8080)