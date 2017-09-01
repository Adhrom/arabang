var chart = AmCharts.makeChart( "gradeChartdiv", {
	"type": "pie",
	"theme": "light",
	"dataProvider": [ {
		"title": "★",
		"value": null
	}, {
		"title": "★★",
		"value": null
	}, {
		"title": "★★★",
		"value": null
	}, {
		"title": "★★★★",
		"value": 85
	}, {
		"title": "★★★★★",
		"value": 42
	}],
	"titleField": "title",
	"valueField": "value",
	"labelRadius": 5,

	"radius": "42%",
	"innerRadius": "60%",
	"labelText": "[[title]]",
	"export": {
		"enabled": true
	}
} );