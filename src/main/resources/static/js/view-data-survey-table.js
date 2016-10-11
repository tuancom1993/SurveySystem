// <![CDATA[

$(document).ready(function(){
	$(".link-show-chart").click(function(){
		$.ajax({
				contentType: 'application/json; charset=utf-8',
				type: 'POST',
				url: '/view-datasurvey/table/chart',
				data: getJsonQuestion($(this).attr("data-id")),
				success : function(data) {
 					var questionChart = JSON.parse(data);

 					if(questionChart.idkindquestion==4) {
 						drawPieChart(questionChart);
 					}

 					if(questionChart.idkindquestion==3) {
 						drawColumnChart(questionChart);
 					}
 					$(".partten").fadeIn(200);
					$(".model-chart").slideDown(300);
				},
			});
	});

	$(".partten").click(function(){
		$(this).fadeOut(400);
		$(".model-chart").slideUp(300);
	});

	function getJsonQuestion(idquestion){
		var question = new Object();
		question["idquestion"] = idquestion;
		var json = JSON.stringify(question);
		console.log(json);
		return json;
	}
});
		

	function drawPieChart(questionChart){
		

		$('.model-chart').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie',
	           
	        },
	        title: {
	            text: "<b>"+questionChart.contentquestion+ "</b>"
	        },
	        subtitle: {
		            text: 'Hover the slice to view select times of answer'
		    },
	        tooltip: {
	        	headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        	pointFormat: '<span style="color:{point.color}">{point.name}</span>: Select <b>{point.y}</b> times in total <b> {point.total} </b> times.',
	           /*formatter: function () {
	                return '<span>' + this.point.name + '</span> Select ' +
	                    this.point.y + ' times in total <b>'+ this.point.total + '</b> times';
	            }*/
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                innerSize: 0,
               		showInLegend: true,
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}:</b> {point.percentage:.1f} %',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: getValueForChart(questionChart, 'pie'),
	    });

	}

	function drawColumnChart(questionChart){
		$('.model-chart').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'column',
	            
	        },
	        yAxis: {
	            allowDecimals: true,
	            title: {
	                text: 'Select times'
	            }
	        },
	        title: {
	            text: "<b>"+questionChart.contentquestion+ "</b>"
	        },
	        tooltip: {
	        	headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        	pointFormat: '<span style="color:{point.color}">{point.name}</span>: Select <b>{point.y}</b> times of total<br/>'
	        },
	        legend: {
		        enabled: true,
		    },
	        plotOptions: {
	            column: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<span style="color:{point.color}">{point.name}</span>: {point.y} times',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        series: getValueForChart(questionChart, 'column'),
	    });

	}

	function getValueForChart(questionChart, kind){
		var answers = questionChart["answerCharts"];
		var series = new Array();
		var serie = new Object();
		serie.name = "Answers";
		serie.colorByPoint = true;
		var vals = new Array();
		for(var i=0; i < answers.length; i++){
			var val = new Object();
			if (kind == 'pie') {
				val.name = '('+answers[i].content+')';
			} else{
				val.name = answers[i].content;	
			}
			val.y = parseInt(answers[i].number);

			vals.push(val);
		}
		serie["data"] = vals;
		series.push(serie);
		return series;
	}
	
// ]]>