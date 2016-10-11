// <![CDATA[
	$(document).ready(function(){
		var chooses = $(".choose");
		chooses.each(function(index, choose){
			if($(choose).hasClass("radio")){
				createChartPie(choose);
			} else if($(choose).hasClass("checkbox")){
				createChartColumn(choose);
			}
		});

		var pdf = new jsPDF('p','pt','a4');

		var specialElementHandlers = { 
			'#editor': function (element, renderer) { 
			    return true; 
			} 
		};
		$('.export').click(function () { 
			pdf.fromHTML($('.wrap-all').html(), 15, 15, { 
		        'width': 190, 
		            'elementHandlers': specialElementHandlers 
		    }); 
			pdf.save('data-survey.pdf'); 
		});
	});

	function createChartPie(choose){
		$(choose).parent().highcharts({
	        data: {
	            table: ''+$(choose).attr("id"),
	            switchRowsAndColumns: true,
	        },
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
            	}
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                innerSize: 100,
               		depth: 45,
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
	        title: {
	            text: 'Data Of Question From Survey'
	        },
	        yAxis: {
	            allowDecimals: true,
	            title: {
	                text: 'Units'
	            }
	        },
	        tooltip: {
	            formatter: function () {
	                return '<b>' + this.point.name + '</b> Select ' +
	                    this.point.y + ' times in total <b>'+ this.point.total + '</b> times';
	            }
	        }
		});
	}

	function createChartColumn(choose){
		$(choose).parent().highcharts({
	        data: {
	            table: ''+$(choose).attr("id"),
	            switchRowsAndColumns: false,
	            endRow: 1,
	        },
	        chart: {
	            type: 'column',
	            options3d: {
	                enabled: true,
	                alpha: 10,
	                beta: 25,
	                depth: 70
            	}
	        },
	        plotOptions: {
	            column: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                depth: 25,
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.series.name}</b>: {point.y} times',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        title: {
	            text: 'Data Of Question From Survey'
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