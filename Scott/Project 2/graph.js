console.log("graphloaded");

function type(d) {
  d.frequency = +d.frequency;
  return d;
}

function doAllTheGraph() {
    var margin = {top: 20, right: 20, bottom: 120, left: 80 },
        width = $("#graph").width() - margin.left - margin.right,
        height = $("#graph").height() - margin.top - margin.bottom;

    var x = d3.scale.ordinal()
            .rangeRoundBands([0, width], .1);

    var y = d3.scale.linear()
            .range([height, 0]);

    var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom");

    var yAxis = d3.svg.axis()
            .scale(y)
            .orient("left")
            .ticks(10, "%");

    var svg = d3.select("#graph").append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
    //        .attr("width", "100%")
    //        .attr("height", height + "px")
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    d3.tsv("graphdata.tsv", type, function(error, data) {
        if (error) throw error;

        x.domain(data.map(function(d) { return d.letter; }));
        y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis)
            .selectAll("text")
            .attr("y", 0)
            .attr("x", 9)
            .attr("dy", ".35em")
            .attr("transform", function(d){
                console.log(d);
                return "rotate(65)"
            })
            .style("text-anchor", "start");


        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text("ABV%");

       
        svg.selectAll(".bar")
            .data(data)
            .enter().append("rect")
            .attr("class", "bar")
            .attr("x", function(d) { return x(d.letter); })
            .attr("width", x.rangeBand())
            .attr("y", function(d) { return y(d.frequency); })
            .attr("height", function(d) { return height - y(d.frequency); });
    });

//     svg.append("g")
//            .attr("class", "x axis")
//            .attr("id", "x")
//            .attr("transform", "translate(0," + height +")")
//            .call(xAxis)
//            

}



doAllTheGraph();




// two ways to do resizing - resize in place or change it all.
// resize in place: http://eyeseast.github.io/visible-data/2013/08/28/responsive-charts-with-d3/

// resize it all by removing and re-adding:

var resizeTimer;

$(window).resize( function() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function() {
        // Run code here, resizing has "stopped
        // blow it all away
        d3.selectAll("#graph svg").remove();
        doAllTheGraph();
  }, 250); // end timeout func
});
