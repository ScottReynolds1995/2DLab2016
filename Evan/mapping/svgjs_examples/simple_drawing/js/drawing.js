var draw = SVG('drawing').size(300, 300);

var rect = draw.rect(100, 100).attr({ fill: '#f06' });

rect.attr({
  'fill': '#f06',
  'fill-opacity': 0.5,
  'stroke': '#000',
  'stroke-width': 10,
  x: 150,
  y: 30
});

draw.rect(50, 50).attr({fill: '#ff6'});
