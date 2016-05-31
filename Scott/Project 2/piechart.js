var pie = new d3pie("piechart", {
	"header": {
		"title": {
			"text": "Most Intriguing Brewery Based On Sound",
			"color": "#000000",
			"fontSize": 24
		},
		"subtitle": {
			"text": "(sound taken form 10 second recording)",
			"color": "#999999",
			"fontSize": 12
		},
		"titleSubtitlePadding": 12
	},
	"footer": {
		"color": "#999999",
		"fontSize": 10,
		"font": "open sans",
		"location": "bottom-left"
	},
	"size": {
		"pieInnerRadius": "23%",
		"pieOuterRadius": "77%"
	},
	"data": {
		"sortOrder": "value-desc",
		"smallSegmentGrouping": {
			"enabled": true,
			"valueType": "value"
		},
		"content": [
			{
				"label": "FourPure",
				"value": 4,
				"color": "#33adff"
			},
			{
				"label": "Partizan",
				"value": 5,
				"color": "#4db8ff"
			},
			{
				"label": "The Kernal",
				"value": 4,
				"color": "#66c2ff"
			},
			{
				"label": "Brew By Numbers",
				"value": 7,
				"color": "#80ccff"
			},
			{
				"label": "Anspach and Hobday",
				"value": 3,
				"color": "#99d6ff"
			},
			{
				"label": "Southwark Brewery",
				"value": 2,
				"color": "#b3e0ff"
			}
		]
	},
	"labels": {
		"outer": {
			"pieDistance": 32
		},
		"inner": {
			"format": "none",
			"hideWhenLessThanPercentage": 3
		},
		"mainLabel": {
			"fontSize": 11
		},
		"percentage": {
			"color": "#ffffff",
			"decimalPlaces": 0
		},
		"value": {
			"color": "#adadad",
			"fontSize": 11
		},
		"lines": {
			"enabled": true
		},
		"truncation": {
			"enabled": true
		}
	},
	"effects": {
		"pullOutSegmentOnClick": {
			"effect": "back",
			"speed": 400,
			"size": 8
		}
	},
	"misc": {
		"gradient": {
			"enabled": true,
			"percentage": 71
		}
	},
	"callbacks": {}
});