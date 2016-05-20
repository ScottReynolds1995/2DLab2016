console.log(L);

var mymap = L.map('mapid').setView([61.505, -0.09], 8);

console.log(mymap);

L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/dark-v8/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'cassieldotcom.lbo5g01j',
    accessToken: 'pk.eyJ1IjoiY2Fzc2llbGRvdGNvbSIsImEiOiJfOXlpQmFJIn0.W5qn7J_RcOV8502RXsDc3Q'
}).addTo(mymap);

//
// made this a function to show how that works
//
function jsonFunc(data, success) {
    
    console.log(success);
    
    for (var i = 0; i < data.length; i++) {
        console.log(data[i].position);
        var pos = data[i].position;
        L.marker(pos).addTo(mymap).bindPopup(
            '<img src = "' + data[i].img + '"width = "200px" />');
    }
}

//
// added error handling
//
//$.getJSON("data.json", jsonFunc)
//  .done(function() {
//    console.log( "second success" );
//  }).fail(function (jqXHR, textStatus, error) {
//    console.log("Post error: " + error);
//    alert("Failed: " + error);
//  }).always(function() {
//    // runs after this is complete, always, no matter what
//    console.log( "complete" );
//  });



var myData = [
//    {"name": "waterloo", 
//     "position": [51.5034, -0.1111],
//     "img": 'images/escalator.JPG'
//    },
//    
//    {"name": "northGreenwich", 
//     "position": [51.5007, 0.0037],
//     "img": 'images/northGreenwich.JPG'
//    },
     
//    {"name": "uniBuilding", 
//     "position": [51.5021, 0.0058],
//     "img": 'images/uniBuilding.JPG'
//    },
    
    {"name": "bikes", 
     "position": [51.5329, -0.1353],
     "img": 'images/bikes.JPG'
    },
    
//    {"name": "church", 
//     "position": [51.5344, -0.1362],
//     "img": 'images/church.JPG'
//    
//    },
//    
//    {"name": "college", 
//     "position": [51.5348, -0.1358],
//     "img" : 'images/college.JPG'
//    
//    },
    
    {"name": "lavender", 
     "position": [51.5363, -0.1389],
     "img": 'images/lavender.JPG'
    
    }
    
    
    
]


jsonFunc(myData);