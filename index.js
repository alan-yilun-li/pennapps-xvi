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


app.get('/getSimilarity', function (req, res) {
  console.log("hi");  
    console.log(getSimilar(data, data))
})



app.listen(8000, function () {
  console.log('Example app listening on port 8000!')
})




function base64_decode(base64str,file) {
   var bitmap = new Buffer(base64str,'base64');
   //writing into an image file
   fs.writeFile(file, bitmap);
   //write a text file
   console.log('File created from base64 encoded string');
}

function getSimilar(file, file2) {
    var input = ["https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg","https://static.pexels.com/photos/39803/pexels-photo-39803.jpeg"];
Algorithmia.client("simMbk6Hq9wmw16NmAYPL5NyCRp1")
           .algo("algo://zskurultay/ImageSimilarity/0.1.4")
           .pipe(input)
           .then(function(response) {
             console.log(response.get());
           });
}

