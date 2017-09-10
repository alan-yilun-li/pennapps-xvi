var express = require('express')
var resemble = require('resemblejs')
var request = require('request')
var app = express()
var Algorithmia = require('algorithmia')



var bodyParser = require('body-parser')
var data = null;

request.get('https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg', function (error, response, body) {
    if (!error && response.statusCode == 200) {
        console.log(data);
        data = response.body;
    }
});


app.post('/getSimilarity', function (req, res) {
  console.log("hi");  
        file1 = res.body;
        console.log(file1);
    console.log(getSimilar("https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg", "https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg"))
})



app.listen(8000, function () {
  console.log('Example app listening on port 8000!')
})

function getSimilar(file, file2) {
    var input = [file,file2];
Algorithmia.client("simMbk6Hq9wmw16NmAYPL5NyCRp1")
           .algo("algo://zskurultay/ImageSimilarity/0.1.4")
           .pipe(input)
           .then(function(response) {
             console.log(response.get());
           });
}

