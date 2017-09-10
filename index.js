var express = require('express')
var app = express()
var Algorithmia = require('Algorithmia')

app.get('/', function (req, res) {
  res.send('Hello World!')
})

app.post('/sendImage', function(req, res) {
    var mapImgUrl = res.body.mapImgUrl;
    mapImgUrl = "https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg";
    var input = ["https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg", mapImgUrl];
Algorithmia.client("simMbk6Hq9wmw16NmAYPL5NyCRp1")
           .algo("algo://zskurultay/ImageSimilarity/0.1.4")
           .pipe(input)
           .then(function(response) {
             console.log(response.get());
           });
})

app.listen(process.env.PORT || 5000, function() {
    console.log("hello");
})