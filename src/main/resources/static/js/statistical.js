// <![CDATA[
	$(document).ready(function(){
		$(".menu .active").removeClass("active");
		$(".menu .mn-manage .mn-statistical a").addClass("active");
		$(".menu .mn-manage").find('a').first().addClass("active");
		
		createTemplateChart();

		$("svg text").each(function(index, textH){
			if($(textH).text() == "Highcharts.com") textH.remove();
		});
	});


	function createTemplateChart(){
		$(".wrap-chart").highcharts({
	        data: {
	            table: 'table-template-chart',
	            switchRowsAndColumns: false,
	            endRow: 1,
	        },
	        chart: {
	            type: 'column',
	            /*options3d: {
	                enabled: true,
	                alpha: 10,
	                beta: 25,
	                depth: 70
            	}*/
	        },
	        plotOptions: {
	            column: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                /*depth: 25,*/
	                dataLabels: {
	                    enabled: true,
	                    format: '<span style="color:red"><b>{point.series.name}</b>: {point.y} times</span>',
	                    style: {
	                        color: '{series.color}'
	                    }
	                }
	            }
	        },
	        title: {
	            text: 'Select time of Template'
	        },
	        yAxis: {
	            allowDecimals: true,
	            title: {
	                text: 'Select times'
	            }
	        },
	        tooltip: {
	            formatter: function () {
	                return '<b>' + this.series.name + '</b><br/>Select ' +
	                    this.point.y + ' times ';
	            }
	        }
		});
	}
// ]]>