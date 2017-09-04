var newOwnerChart = AmCharts.makeChart("newOwnerChartdiv", {
	"theme" : "light",
	"type" : "serial",
	"marginRight" : 80,
	"autoMarginOffset" : 20,
	"marginTop" : 20,
	"valueAxes" : [ {
		"id" : "v1",
		"axisAlpha" : 0.1
	} ],
	"graphs" : [ {
		"useNegativeColorIfDown" : true,
		"balloonText" : "[[category]]<br><b>value: [[value]]</b>",
		"bullet" : "round",
		"bulletBorderAlpha" : 1,
		"bulletBorderColor" : "#FFFFFF",
		"hideBulletsCount" : 50,
		"lineThickness" : 2,
		"lineColor" : "#fdd400",
		"negativeLineColor" : "#67b7dc",
		"valueField" : "visits"
	} ],
	"chartScrollbar" : {
		"scrollbarHeight" : 5,
		"backgroundAlpha" : 0.1,
		"backgroundColor" : "#868686",
		"selectedBackgroundColor" : "#67b7dc",
		"selectedBackgroundAlpha" : 1
	},
	"chartCursor" : {
		"valueLineEnabled" : true,
		"valueLineBalloonEnabled" : true
	},
	"categoryField" : "date",
	"categoryAxis" : {
		"parseDates" : true,
		"axisAlpha" : 0,
		"minHorizontalGap" : 60
	},
	"export" : {
		"enabled" : true
	}
});
