var gradeChart = AmCharts.makeChart( "gradeChartdiv", {
	"type": "pie",
	"theme": "light",
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