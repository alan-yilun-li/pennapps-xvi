var express = require('express')
var app = express()
var Algorithmia = require('Algorithmia')

app.get('/', function (req, res) {
  res.send('Hello World!')
})

app.post('/sendImage', function(req, res, callback) {
    var mapImgUrl = req.body.mapImgUrl;
    var photoUrl = req.body.photoUrl;
  
    var input = [photoUrl, mapImgUrl];

    Algorithmia.client("simMbk6Hq9wmw16NmAYPL5NyCRp1")
           .algo("algo://zskurultay/ImageSimilarity/0.1.4")
           .pipe(input)
           .then(function(response) {
                console.log(response.get())
                res.send({"similarity": response.get()})
             //res.redirect('/sendImage'+ "?similarity=" + toString(response.get()));
            //return callback(response.get())
           });
})

app.listen(process.env.PORT || 5000, function() {
    console.log("hello");
})