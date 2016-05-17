console.log(L);

var mymap = L.map('mapid').setView([51.505, -0.09], 8);

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
        L.marker(pos).addTo(mymap).bindPopup(data[i].name);
    }
}



//
// added error handling
////
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


// the json data is just the following, we could have copied/pasted it:
//
var myData = [
    {"name": "someone", "position": [51.50230833333333,0.009558333333333332]},
    {"name": "someone else", "position": [50.0, 0.1]},
    {"name": "Margate", "position": [51.3770212, 1.3480567]}
];

jsonFunc(myData);