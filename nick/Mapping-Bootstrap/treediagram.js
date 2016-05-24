////// d3 tree map

//https://github.com/d3/d3/wiki/Tree-Layout
//http://bl.ocks.org/d3noob/8375092

// you can change the data here! Add your own.
var treeData = [
  {
    "name": "Top Level",
    "parent": "null",
    "children": [
      {
        "name": "Level 2: A",
        "parent": "Top Level",
        "children": [
          {
            "name": "Son of A",
            "parent": "Level 2: A"
          },
          {
            "name": "Daughter of A",
            "parent": "Level 2: A"
          }
        ]
      },
      {
        "name": "Level 2: B",
        "parent": "Top Level"
      }
    ]
  }
];




// ************** Generate the tree diagram	 *****************
var treemargin = {top: 20, right: 20, bottom: 30, left: 20},
    treewidth = $("#tree").width() - treemargin.left - treemargin.right,
    treeheight = $("#tree").height() - treemargin.top - treemargin.bottom;
	
var i = 0,
	duration = 750,
	treeroot;

var tree = d3.layout.tree()
	.size([treeheight, treewidth]);

var diagonal = d3.svg.diagonal()
	.projection(function(d) { return [d.y, d.x]; });

var treesvg = d3.select("#tree").append("svg")
	.attr("width", treewidth + treemargin.right + treemargin.left)
	.attr("height", treeheight + treemargin.top + treemargin.bottom)
  .append("g")
	.attr("transform", "translate(" + treemargin.left + "," + treemargin.top + ")");

treeroot = treeData[0];
treeroot.x0 = height / 2;
treeroot.y0 = 0;
  
treeupdate(treeroot);

//d3.select(self.frameElement).style("height", "500px");

function treeupdate(source) {

  // Compute the new tree layout.
  var nodes = tree.nodes(treeroot).reverse(),
	  links = tree.links(nodes);

  // Normalize for fixed-depth.
  nodes.forEach(function(d) { d.y = d.depth * 180; });

  // Update the nodes…
  var node = treesvg.selectAll("g.node")
	  .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
	  .attr("class", "node")
	  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
	  .on("click", click);

  nodeEnter.append("circle")
	  .attr("r", 1e-6)
	  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeEnter.append("text")
	  .attr("x", function(d) {
        var val = -13;
        if (d.parent != "null") 
            val = d.children || d._children ? -13 : 13; 
        return val;
      })
	  .attr("dy", function(d) {
        if (d.parent != "null") return "0.34em";
        else return "-1.34em";
       })
	  .attr("text-anchor", function(d) {
        if (d.parent == "null") 
            return "start";
        else
            return d.children || d._children ? "end" : "start"; 
      })
	  .text(function(d) { return d.name; })
	  .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
	  .duration(duration)
	  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
	  .attr("r", 10)
	  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeUpdate.select("text")
	  .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
	  .duration(duration)
	  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
	  .remove();

  nodeExit.select("circle")
	  .attr("r", 1e-6);

  nodeExit.select("text")
	  .style("fill-opacity", 1e-6);

  // Update the links…
  var link = treesvg.selectAll("path.link")
	  .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
	  .attr("class", "link")
	  .attr("d", function(d) {
		var o = {x: source.x0, y: source.y0};
		return diagonal({source: o, target: o});
	  });

  // Transition links to their new position.
  link.transition()
	  .duration(duration)
	  .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
	  .duration(duration)
	  .attr("d", function(d) {
		var o = {x: source.x, y: source.y};
		return diagonal({source: o, target: o});
	  })
	  .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
	d.x0 = d.x;
	d.y0 = d.y;
  });
}

// Toggle children on click.
function click(d) {
  if (d.children) {
	d._children = d.children;
	d.children = null;
  } else {
	d.children = d._children;
	d._children = null;
  }
  update(d);
}
