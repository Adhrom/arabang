var reservationChart = AmCharts.makeChart("reservationChartdiv", {
    "type": "serial",
    "theme": "light",
    "valueAxes": [{
        "axisAlpha": 0,
        "dashLength": 4,
        "position": "left"
    }],
    "graphs": [{
        "bulletSize": 14,
        "customBullet": "https://www.amcharts.com/lib/3/images/star.png?x",
        "customBulletField": "customBullet",
        "valueField": "value",
         "balloonText":"<div style='margin:10px; text-align:left;'><span style='font-size:13px'>[[category]]</span><br><span style='font-size:18px'>Value:[[value]]</span>",
    }],
    "marginTop": 20,
    "marginRight": 70,
    "marginLeft": 40,
    "marginBottom": 20,
    "chartCursor": {
        "graphBulletSize": 1.5,
        "zoomable":false,
         "valueZoomable":true,
         "cursorAlpha":0,
         "valueLineEnabled":true,
         "valueLineBalloonEnabled":true,
         "valueLineAlpha":0.2
    },
    "autoMargins": false,
    "dataDateFormat": "YYYY-MM-DD",
    "categoryField": "date",
    "valueScrollbar":{
      "offset":30
    },
    "categoryAxis": {
        "parseDates": true,
        "axisAlpha": 0,
        "gridAlpha": 0,
        "inside": true,
        "tickLength": 0
    },
    "export": {
        "enabled": true
    }
});
