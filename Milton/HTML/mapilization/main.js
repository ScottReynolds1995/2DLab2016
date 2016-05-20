var mymap = L.map('mapid').setView([51.5075179,-0.1277935], 11); // declaring the map's view

//getting the json object with the id and token properties
$.getJSON('property.json', function(property){
    //getting
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: property.id,
        accessToken: property.token
    }).addTo(mymap);
});

//  getting the data to plot on the map
$.getJSON('daata.json', function(data){

    data.forEach(function(obj, key){
        console.log(obj);

        // the following is in charge of binding the popups to the markers on the map
        // I added a onclick attribute to the button element
        // It's usually best to do it through javascript, but these get created on the fly
        // so any event listeners bound to them simply disapear after they get clicke closed
        L.marker(obj.position).addTo(mymap).bindPopup("<b>" + obj.name +
            "</b> <button onclick='buttClicked()' class='inPopup' id='button"
            + key + "' class='" + "picClick" + "' data-dir='" + obj.dir
            + "'>Click me to see me </button>").openPopup();
    });
});

// The function in charge of displaying the pictures of the location
function buttClicked(){
    $butt = $('button.inPopup'); // assigning the button that is currently being displayed to a variable
    console.log($butt);

    // Getting the directorry of the picture from the data tag
    var picDir = $butt.data('dir');
    console.log(picDir);

    // creating the picture element
    var picElem = $("<img class='picDisplayed' src='" + picDir + "' />");
    // assigning div#picDisplay to a variable
    $picDisplay = $('#picDisplay');
    // removing any pre-exhisting picture element from the div#picDisplay
    $picDisplay.children('img').remove();
    // appending the picture element previously created to the div#picDisplay
    $picDisplay.append(picElem);

}

//  Next steps
// add a about place feature that is displayed next to where the picture of the place
// After the features a added apply better transitions
