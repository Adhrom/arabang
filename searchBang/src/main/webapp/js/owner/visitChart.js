/**
 * 
 */

var chart = AmCharts.makeChart( "visitChartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [ {
    "country": "월요일",
    "visits": 10
  }, {
    "country": "화요일",
    "visits": 15
  }, {
    "country": "수요일",
    "visits": 8
  }, {
    "country": "목요일",
    "visits": 20
  }, {
    "country": "금요일",
    "visits": 40
  }, {
    "country": "토요일",
    "visits": 60
  }, {
    "country": "일요일",
    "visits": 30
  },],
  "valueAxes": [ {
    "gridColor": "#FFFFFF",
    "gridAlpha": 0.2,
    "dashLength": 0
  } ],
  "gridAboveGraphs": true,
  "startDuration": 1,
  "graphs": [ {
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "fillAlphas": 0.8,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  } ],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "country",
  "categoryAxis": {
    "gridPosition": "start",
    "gridAlpha": 0,
    "tickPosition": "start",
    "tickLength": 20
  },
  "export": {
    "enabled": true
  }

} );