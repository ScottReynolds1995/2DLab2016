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
         
        L.marker(pos).addTo(mymap).bindPopup(
            
            
              '<div class="popup">'+data[i].name+'</div>' +
              '<div class="popup"><img src="' + data[i].img + '"/></div>'+
    '<div class="popup">' + 
    '<audio controls>' +
    '<source src="' + data[i].snd + '" type="audio/mpeg">' +
    '    Your browser does not support the audio tag.' +
    '</audio>' + 
    '</div>'
);

    }
    
};
var mapData = [
    //{"name": "someone", "position": [50.0, 0.0], "img": 'httpxxxxxx'},
    
    {
        "name": "Southwark Brewery",
        "position": ["51.5007", "-0.077"],
        "img": 'data/southwarkbrewingco.jpg',
        "snd": 'data/southwarkbrewingco.mp3'     
    },
    
    {
        "name": "Anspach & Hobday",
        "position": ["51.4988", "-0.0734"],
        "img": 'data/anspachandhobday.jpg',
        "snd": 'data/anspachandhobday.mp3'
    },
    
    {
        "name": "Brew By Numbers",
        "position": ["51.4974", "-0.0721"],
        "img": 'data/brewbynumber.jpg',
        "snd": 'data/brewbynumber.mp3'
    },
    
       {
        "name": "The Kernal Brewery",
        "position": ["51.4948", "-0.0686"],
           "img": 'data/kernal.jpg',
           "snd": 'data/kernal.mp3'
           
    },
    
    {
        "name": "Partizan Brewery",
        "position": ["51.4918", "-0.0599"],
        "img": 'data/partizan.jpg',
        "snd": 'data/partizan.mp3'
    },
    
     {
        "name": "Fourpure Brewing Co",
        "position": ["51.4901", "-0.0553"],
        "img": 'data/fourpure.jpg',
      "snd": 'data/fourpure.mp3'
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