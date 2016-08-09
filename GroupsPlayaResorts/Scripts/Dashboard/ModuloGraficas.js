var Graficas = {};
var porTres = true;

function CreaTabla(obj) {
    var objDatos = JSON.parse(obj.json);
    var $padreDiv = $('#' + obj.destinoGrafica).parent();

    $('.bootstrap-table.' + obj.destinoGrafica).html('');
    $('.bootstrap-table.' + obj.destinoGrafica).remove();

    var tabla = '<table id="tabla' + obj.destinoGrafica + '" class="table-no-bordered table table-hover"><thead><tr><td></td></tr></thead><tbody></tbody></table>';
    $($padreDiv).append('<div class="bootstrap-table ' + obj.destinoGrafica + '"><div class="tabla' + obj.destinoGrafica + ' block" style="display:none;">' + tabla + '</div></div>');

    if (obj.tipoGrafica == 'pie' || objDatos.categorias.length == 0) {
        $('#tabla' + obj.destinoGrafica).find('thead').find('tr').append('<td class="th-inner">Revenue</td>');
    } else {
        for (var i = 0; i < objDatos.categorias.length; i++) {
            var categoriaActual = objDatos.categorias[i];

            $('#tabla' + obj.destinoGrafica).find('thead').find('tr').append('<td class="th-inner">' + categoriaActual + '</td>')
        };
    }

    if (obj.tablaTotales) {
        $('#tabla' + obj.destinoGrafica).find('thead').find('tr').append('<td class="th-inner">Percentage</td>');
    };

    for (var i = 0; i < objDatos.datos.length; i++) {
        var datoActual = objDatos.datos[i];
        var tds = '';

        if (obj.tipoGrafica == 'pie') {
            tds = '<td>$' + datoActual.y.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>'

            if (obj.tablaTotales) {
                tds = tds + '<td>' + datoActual.pct.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,").match(/^\d+(?:\.\d{0,2})?/) + '%</td>';
            }
        } else {
            for (var j = 0; j < datoActual.data.length; j++) {
                valorActual = datoActual.data[j].y;
                tds = tds + '<td>$' + valorActual.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + '</td>';

                if (obj.tablaTotales) {
                    tds = tds + '<td>' + datoActual.data[j].pct.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,").match(/^\d+(?:\.\d{0,2})?/) + '%</td>';
                }
            };
        }

        $('#tabla' + obj.destinoGrafica).find('tbody').append('<tr><td>' + datoActual.name + '</td>' + tds + '</tr>');
    };
}

function MostrarOcultarGrafica($elemento) {
    var attr = $($elemento).attr('data-tabla');
    var $tabla = $('.tabla' + attr);

    if ($tabla.is(":visible")) {
        $tabla.hide();
    } else {
        $tabla.show();
    }
}

Graficas.CargaGrafica = function (obj) {
    var colorHotel = obj.colorHotel;
    var objDatos = JSON.parse(obj.json);

    if (!colorHotel || colorHotel == '') {
        colorHotel = Highcharts.getOptions().colors[0];
    }

    if (objDatos.datos.length == 0) {
        $('.w' + obj.destinoGrafica).show();
    } else {
        $('.w' + obj.destinoGrafica).hide();
    }

    if (obj.tipoGrafica == 'pie' && !obj.drill) {
        objDatos.datos = [{
            type: 'pie',
            name: 'pct',
            data: objDatos.datos
        }];
    } else if (obj.tipoGrafica == 'pie' && obj.drill) {
        var objDatosAux = [];

        if (obj.versus) {
            var objDatos2 = JSON.parse(obj.json2);
            var statusData2 = new Array();
            var groupData2 = new Array();
            var dataLen2 = objDatos.datos.length;
            var drillDataLen2 = 0;
            var brightness2 = 0;

            for (var i = 0; i < dataLen2; i++) {

                statusData2.push({
                    name: objDatos2.categorias[i],
                    y: objDatos2.datos[i].y,
                    color: objDatos2.datos[i].drilldown.colorDato,
                    id: objDatos2.datos[i].drilldown.id
                });

                drillDataLen2 = objDatos2.datos[i].drilldown.data.length;

                for (var j = 0; j < drillDataLen2; j++) {
                    brightness2 = 0.2 - (j / drillDataLen2) / 5;

                    groupData2.push({
                        name: objDatos2.datos[i].drilldown.categories[j],
                        y: objDatos2.datos[i].drilldown.data[j],
                        color: '#' + objDatos2.datos[i].drilldown.coloresDatos[j],
                        id: objDatos2.datos[i].drilldown.idsData[j],
                        idpadre: objDatos2.datos[i].drilldown.id
                    });
                }
            };

            objDatosAux.push({
                type: 'pie',
                data: statusData2,
                size: '50%',
                center: ['25%'],
                dataLabels: {
                    formatter: function () {
                        return this.y > 5 ? this.point.name : null;
                    },
                    color: '#ffffff',
                    distance: -30
                },
                point: {
                    events: {
                        click: function (event) {
                            porTres = false;
                            CambiaFiltroGrafica(this.options.id, 'drill');
                        },
                    }
                },
                cursor: 'pointer'
            }, {
                type: 'pie',
                data: groupData2,
                size: '50%',
                innerSize: '50%',
                center: ['25%'],
                dataLabels: {
                    formatter: function () {
                        return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '' : null;
                    }
                },
                point: {
                    events: {
                        click: function (event) {
                            porTres = false;
                            CambiaFiltroGrafica(this.options.idpadre, 'drill2', this.options.id);
                        }
                    }
                },
                cursor: 'pointer'
            });
        }

        var statusData = new Array();
        var groupData = new Array();
        var dataLen = objDatos.datos.length;
        var drillDataLen = 0;
        var brightness = 0;

        for (var i = 0; i < dataLen; i++) {

            statusData.push({
                name: objDatos.categorias[i],
                y: objDatos.datos[i].y,
                color: objDatos.datos[i].drilldown.colorDato,
                id: objDatos.datos[i].drilldown.id
            });

            drillDataLen = objDatos.datos[i].drilldown.data.length;

            for (var j = 0; j < drillDataLen; j++) {
                brightness = 0.2 - (j / drillDataLen) / 5;

                groupData.push({
                    name: objDatos.datos[i].drilldown.categories[j],
                    y: objDatos.datos[i].drilldown.data[j],
                    color: '#' + objDatos.datos[i].drilldown.coloresDatos[j],
                    id: objDatos.datos[i].drilldown.idsData[j],
                    idpadre: objDatos.datos[i].drilldown.id
                });
            }
        };

        objDatosAux.push({
            type: 'pie',
            data: statusData,
            size: (obj.versus) ? '50%' : '80%',
            center: (obj.versus) ? ['80%'] : '',
            dataLabels: {
                formatter: function () {
                    return this.y > 5 ? this.point.name : null;
                },
                color: '#ffffff',
                distance: -30
            },
            point: {
                events: {
                    click: function (event) {
                        porTres = false;
                        CambiaFiltroGrafica(this.options.id, 'drill');
                    },
                }
            },
            cursor: 'pointer'
        }, {
            type: 'pie',
            data: groupData,
            size: (obj.versus) ? '50%' : '80%',
            innerSize: (obj.versus) ? '50%' : '60%',
            center: (obj.versus) ? ['80%'] : '',
            dataLabels: {
                formatter: function () {
                    return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '' : null;
                }
            },
            point: {
                events: {
                    click: function (event) {
                        porTres = false;
                        CambiaFiltroGrafica(this.options.idpadre, 'drill2', this.options.id);
                    }
                }
            },
            cursor: 'pointer'
        });

        objDatos.datos = objDatosAux;
    } else if (obj.tipoGrafica == 'column' && obj.segundaGrafica) {
        var arrayAux = new Array();

        for (var i = 0; i < objDatos.datos.length; i++) {
            var datoActual = objDatos.datos[i];

            for (var j = 0; j < datoActual.data.length; j++) {
                arrayAux[j] = ($.isNumeric(arrayAux[j])) ? arrayAux[j] : 0;
                arrayAux[j] = arrayAux[j] + datoActual.data[j].y;
            };
        };

        var arrayDatosFinal = new Array();

        for (var i = 0; i < arrayAux.length; i++) {
            arrayDatosFinal.push({ y: arrayAux[i], click: 0, nombreReal: '', codigo: 'Total' });
        };

        objDatos.datos.push({
            type: 'area',
            name: 'Totals',
            data: arrayDatosFinal,
            marker: {
                lineWidth: 2,
                lineColor: colorHotel,
                fillColor: colorHotel
            },
            color: colorHotel,
            dejarVisible: true
        });
    }

    var opcGraficas = {
        chart: {
            events: {
                load: function () { if (obj.tieneTabla) { CreaTabla({ json: obj.json, destinoGrafica: obj.destinoGrafica, tipoGrafica: obj.tipoGrafica, simple: obj.simple, tablaTotales: obj.tablaTotales }); } }
            },
            type: (obj.versusGrafica) ? obj.versusGrafica : obj.tipoGrafica,
            zoomType: (obj.segundaGrafica) ? 'x' : '',
            options3d: {
                enabled: (obj.activa3D) ? true : false,
                alpha: (obj.tipoGrafica == 'pie') ? 45 : 5,
                beta: (obj.tipoGrafica == 'pie') ? 0 : 5,
                depth: 0,
                viewDistance: 0
            },
            marginTop: 80,
            marginRight: 40,
            backgroundColor: '#13467B',
            style: {
                color: '#fff'
            }
        },
        title: {
            text: obj.tituloReporte,
            style: {
                color: '#fff'
            }
        },
        tooltip: {
            formatter: function () {
                var s = '';
                var nombreReal = '';
                var pointpie = '';
                var codigo = '';

                if (this.point.name) { // the pie chart
                    if (obj.drill) {
                        if (this.point.idpadre) {
                            if (porTres) {
                                pointpie = Highcharts.numberFormat(this.point.percentage * 3, 2) + '%';
                            } else {
                                pointpie = Highcharts.numberFormat(this.point.percentage, 2) + '%';
                            }
                        } else {
                            pointpie = Highcharts.numberFormat(this.point.y, 0);
                        }
                    } else {
                        pointpie = '$' + Highcharts.numberFormat(this.point.y, 2);
                    }

                    if (this.point.alias) {
                        codigo = this.point.alias + ': ';
                    }

                    s = '<b> ' + this.point.name + ' </b><br/>' + codigo + pointpie;
                } else {
                    if (this.point.nombreReal != '') {
                        nombreReal = '<b> ' + this.point.nombreReal + ' </b><br/>';
                    }
                    s = nombreReal + '<span style="color:' + this.point.color + '">\u25CF</span> ' + this.point.codigo + ': $' + Highcharts.numberFormat(this.point.y, 2);
                }
                return s;
            }
        },
        series: objDatos.datos,
        legend: {
            itemStyle: { "color": "#fff", "cursor": "pointer", "fontSize": "12px", "fontWeight": "bold" }
        }
    }

    if (obj.tipoGrafica != 'pie') {
        opcGraficas.xAxis = {
            gridLineColor: 'grey',
            categories: objDatos.categorias,
            title: {
                text: obj.xTitulo
            },
            labels: {
                enabled: (!obj.muestraLabels || obj.muestraLabels == '1') ? true : false,
                style: {
                    color: '#fff'
                }
            }
        };

        opcGraficas.yAxis = {
            gridLineColor: 'grey',
            allowDecimals: true,
            min: 0,
            title: {
                text: obj.yTitulo,
                style: {
                    color: '#fff'
                }
            },
            labels: {
                style: {
                    color: '#fff'
                }
            },
            plotLines: (obj.plotLines && objDatos.plotLines) ? objDatos.plotLines[0] : []
        };

        opcGraficas.plotOptions = {
            column: {
                depth: 40
            },
            series: {
                dataLabels: {
                    enabled: (!obj.muestraLabelsColumna || obj.muestraLabelsColumna == '1') ? true : false,
                    format: '${point.y:,.2f}'
                },
                cursor: (obj.versus) ? '' : 'pointer',
                point: {
                    events: {
                        click: function () {
                            if (this.options.click != 0) {
                                CambiaFiltroGrafica(this.options.codigo);
                            }
                        }
                    }
                }
            }
        }

        if (!obj.versus) {
            opcGraficas.plotOptions.area = {
                fillColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, colorHotel],
                        [1, Highcharts.Color(colorHotel).setOpacity(0).get('rgba')]
                    ]
                }
            }
        }
    } else if (obj.tipoGrafica == 'pie' && !obj.drill) {
        opcGraficas.plotOptions = {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35
            }, series: {
                cursor: (obj.versus) ? '' : 'pointer',
                point: {
                    events: {
                        click: function () {
                            if (this.options.click != 0) {
                                CambiaFiltroGrafica(this.options.codigo, 'pie');
                            }
                            //window.open('paginadeejemplo.html?empresa='+this.options.codigo,'_blank');

                        }
                    }
                },
                dataLabels: {
                    format: '{point.nPie}'
                }
            }
        };
    }

    $('#' + obj.destinoGrafica).highcharts(opcGraficas);
};

Graficas.CreaDiv = function (obj) {
    var claseGrafica = '';
    $('#' + obj.destinoGrafica).html('');

    if (obj.tipoGrafica == 'pie' && !obj.drill) {
        claseGrafica = 'class="graficaPie"';
    } else if (obj.tipoGrafica != 'pie') {
        claseGrafica = 'class="grafica"';
    }

    var objDrill = (obj.drill) ? obj.drill : '';
    var btnMOTabla = (obj.tieneTabla) ? '<label class="btn graficas" data-tabla="' + obj.destinoGrafica + '" onclick="MostrarOcultarGrafica(this);" style="right: 42px;"><i class="fa fa-table"></i></label>' : '';
    btnMOTabla = btnMOTabla + '<label class="btn graficas" data-drill="' + objDrill + '" data-tipoGrafica="' + obj.tipoGrafica + '" onclick="ReiniciaFiltros(this);"><i class="fa fa-refresh"></i></label>';

    if (obj.periodo) {
        btnMOTabla = btnMOTabla + '<label class="btn graficas" onclick="OcultarDatos();" style="right: 85px;"><i class="fa fa-minus-square"></i></label>';
    }

    $('#Dashboard').append('<div class="dash"><div class="warning w' + obj.destinoGrafica + '" style="display:none;">No data were found with this view</div><div id="' + obj.destinoGrafica + '" ' + claseGrafica + ' style="overflow:hidden;border-radius:5px;"></div>' + btnMOTabla + '</div>');

    var arrayDash = $('.dash');

    if (arrayDash.length > 1) {;
        for (var i = 0; i < arrayDash.length; i++) {
            $dashActual = $(arrayDash[i]);
            $dashActual.width('49%');
        };
    }
};