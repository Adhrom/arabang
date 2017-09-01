var chart = AmCharts.makeChart("paymentChartdiv", {
	"type" : "serial",
	"theme" : "light",
	"marginRight" : 40,
	"marginLeft" : 40,
	"autoMarginOffset" : 20,
	"mouseWheelZoomEnabled" : true,
	"dataDateFormat" : "YYYY-MM-DD",
	"valueAxes" : [ {
		"id" : "v1",
		"axisAlpha" : 0,
		"position" : "left",
		"ignoreAxisWidth" : true
	} ],
	"balloon" : {
		"borderThickness" : 1,
		"shadowAlpha" : 0
	},
	"graphs" : [ {
		"id" : "g1",
		"balloon" : {
			"drop" : true,
			"adjustBorderColor" : false,
			"color" : "#ffffff"
		},
		"bullet" : "round",
		"bulletBorderAlpha" : 1,
		"bulletColor" : "#FFFFFF",
		"bulletSize" : 5,
		"hideBulletsCount" : 50,
		"lineThickness" : 2,
		"title" : "red line",
		"useLineColorForBulletBorder" : true,
		"valueField" : "value",
		"balloonText" : "<span style='font-size:18px;'>[[value]]</span>"
	} ],
	"chartScrollbar" : {
		"graph" : "g1",
		"oppositeAxis" : false,
		"offset" : 30,
		"scrollbarHeight" : 15,
		"backgroundAlpha" : 0,
		"selectedBackgroundAlpha" : 0.1,
		"selectedBackgroundColor" : "#888888",
		"graphFillAlpha" : 0,
		"graphLineAlpha" : 0.5,
		"selectedGraphFillAlpha" : 0,
		"selectedGraphLineAlpha" : 1,
		"autoGridCount" : true,
		"color" : "#AAAAAA"
	},
	"chartCursor" : {
		"pan" : true,
		"valueLineEnabled" : true,
		"valueLineBalloonEnabled" : true,
		"cursorAlpha" : 1,
		"cursorColor" : "#258cbb",
		"limitToGraph" : "g1",
		"valueLineAlpha" : 0.2,
		"valueZoomable" : true
	},
	"valueScrollbar" : {
		"oppositeAxis" : false,
		"offset" : 50,
		"scrollbarHeight" : 10
	},
	"categoryField" : "date",
	"categoryAxis" : {
		"parseDates" : true,
		"dashLength" : 1,
		"minorGridEnabled" : true
	},
	"export" : {
		"enabled" : true
	}
});

chart.addListener("rendered", zoomChart);
$.getJSON("http://localhost:8080/searchBang/sales.owner?accom_no=117",
		function(data) {
			chart.dataProvider = data;
			chart.validateData();
		});
zoomChart();

function zoomChart() {
	chart.zoomToIndexes(chart.dataProvider.length - 40,
			chart.dataProvider.length - 1);
}