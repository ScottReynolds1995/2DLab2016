console.log(L);
var mymap = L.map('mapid').setView([51.505, -0.09], 8);
L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/dark-v8/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'cassieldotcom.lbo5g01j',
    accessToken: 'pk.eyJ1IjoiY2Fzc2llbGRvdGNvbSIsImEiOiJfOXlpQmFJIn0.W5qn7J_RcOV8502RXsDc3Q'
}).addTo(mymap);
function jsonFunc(data) {
    
    for (var i = 0; i < data.length; i++) {
        console.log(data[i].position);
        var pos = data[i].position;
        L.marker(pos).addTo(mymap);
    }
};
var mapData = [
    //{"name": "someone", "position": [50.0, 0.0], "img": 'httpxxxxxx'},
    
    {
        "name": "Southwark Brewery",
        "position": ["51.5007", "-0.077"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },
    
    {
        "name": "Anspach & Hobday",
        "position": ["51.4988", "-0.0734"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },
    
    {
        "name": "Brew By Numbers",
        "position": ["51.4974", "-0.0721"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },
    
       {
        "name": "The Kernal Brewery",
        "position": ["51.4948", "-0.0686"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },
    
    {
        "name": "Partizan Brewery",
        "position": ["51.4918", "-0.0599"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },
    
     {
        "name": "Fourpure Brewing Co",
        "position": ["51.4901", "-0.0553"],
        "img": 'http://cuteimages.net/data/2015/11/small-kitten-photos-cuteimages.net.jpg'
    },




];
jsonFunc(mapData);

// {"name": "Southwark Brewery", "position": [51.5007, -0.077]},
//    {"name": "Anspach & Hobday", "position": [51.4988, -0.0734]},
//    {"name": "Brew By Numbers", "position": [51.4974, -0.0721]},
//    {"name": "The Kernal Brewery", "position": [51.4948, -0.0686]},
//    {"name": "Partizan Brewery", "position": [51.4918, -0.0599]},
//    {"name": "Fourpure Brewing Co", "position": [51.4901, -0.0553]},
//    