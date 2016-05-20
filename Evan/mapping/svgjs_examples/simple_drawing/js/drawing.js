var draw = SVG('drawing').size(500, 500);

var rect = draw.rect(100, 100);


rect.attr({
    'fill': '#f06', 
    'fill-opacity': 0.5,
    'stroke': '#000', 
    'stroke-width': 10,
    x : 150,
    y : 30
});


// http://documentup.com/wout/svg.js#events-1

rect.click(function() {
  this.fill({ color: '#e0e' })
});

var text = draw.text("Lorem ipsum dolor sit amet consectetur.\nCras sodales imperdiet auctor.")

text.attr({x: 100, y:20});

draw.rect(50, 50).attr({ fill: '#ff6' });

