var estructura = {};
var arrayStatus = new Array();
var consUrl = 'http://agents.realresorts.com/catalogos/?cmd=js:json'
var coloresStatus = [{ id: "1", color: '#7cb5ec' }, { id: "2", color: '#434348' }, { id: "3", color: '#90ed7d' }]
var arrayTipoFecha = [{ valor: 2, texto: "Quote date" }, { valor: 1, texto: "Checkin" }];
var botonCTLPAST = '<div class="divFiltro" style="float:right !important;font-size:0.8em !important;"><span class="globos" data-tipo="agencia" onclick="copyfieldvalue(event);">Share it.</span></span></div>';
var btnIrDetalle = '<div class="divFiltro" style="float:right !important;font-size:0.8em !important;"><span class="globos" data-tipo="agencia" onclick="IrAlDetalle();">Show details.</span></span></div>';

function IrAlDetalle() {
    var hotel = ($('#hoteles option:selected').attr('data-codigo')) ? $('#hoteles option:selected').attr('data-codigo') : '';
    var agencia = ($('#agencias option:selected').attr('data-codigo')) ? $('#agencias option:selected').attr('data-codigo') : '';
    var periodo = $('#tipoperiodo').val();
    var status = $('#statustipo').val();
    var date1 = $('#datetimepicker1').find(':first:input').val().replace(/\-/g, '');
    var date2 = $('#datetimepicker2').find(':first:input').val().replace(/\-/g, '');
    var tipoGrupo = $('#grupotipo').val();
    var tipofecha = ($('#tipofecha').val()) ? $('#tipofecha').val() : '';

    var parametros = '?hotel=' + hotel + '&agencia=' + agencia + '&tipoperiodo=' + periodo + '&statustipo=' + status + '&fini=' + date1 + '&ffin=' + date2 + '&statusgrupo=' + tipoGrupo + '&tipofecha=' + tipofecha;

    window.open('Groups/GroupsList/' + parametros, '_blank');
}

function copySelectionText() {
    var copysuccess; // var to check whether execCommand successfully executed
    try {
        copysuccess = document.execCommand("copy"); // run command to copy selected text to clipboard
    } catch (e) {
        copysuccess = false;
    }
    return copysuccess;
}

function copyfieldvalue(e) {
    var field = document.getElementById('url');
    field.style.display = 'block';
    field.focus();
    field.setSelectionRange(0, field.value.length);
    var resultado = copySelectionText();
    field.style.display = 'none';

    if (resultado) {
        alert('URL copied to clipboard.');
    } else {
        alert('Sorry, the URL could not be copied to the clipboard.');
    }
}

function $_GET(_parametro) {
    var url = document.URL;
    var arrayGets = [];
    url = String(url.match(/\?+.+/));
    url = (url != 'null') ? url.replace('?', '') : '';
    url = (url != '') ? url.split("&") : [];

    if (url.length > 0) {
        if (!_parametro) {
            var arrayValores = [];

            for (var i = 0; i < url.length; i++) {
                var tmp = url[i].split('=');
                arrayValores.push({ parametro: tmp[0], valor: unescape(decodeURI(tmp[1])) });
            };

            return arrayValores;
        } else {
            var x = 0;

            while (x < url.length) {
                var p = url[x].split("=");

                if (p[0] == _parametro) {
                    x = url.length;
                    return decodeURIComponent(p[1]);
                } else {
                    x++;
                }
            }

        }
    } else {
        return undefined;
    }
}

function compare(a, b) {
    if (a.codigo < b.codigo) {
        return -1;
    } else if (a.codigo > b.codigo) {
        return 1;
    } else {
        return 0;
    }
}

function uniqBy(a, key) {
    var seen = {};
    return a.filter(function (item) {
        var k = key(item);
        return seen.hasOwnProperty(k) ? false : (seen[k] = true);
    })
}

function LlenaSelectGrupoStatus(_primeraVez, _bloqueaRecarga) {
    var tipoStatus = $('#statustipo').val();
    var arrayGS = new Array();
    var selectGS = '';

    var tipoStatus = $('#statustipo').val();
    var arrayGS = new Array();
    var selectGS = '';

    if (!_primeraVez) {
        if (tipoStatus) {
            arrayGS = $.grep(arrayStatus, function (e) {
                return e.valor == tipoStatus;
            });

            selectGS = selectGS + '<option value="">(All status group)</option>';

            for (var i = 0; i < arrayGS[0].tipos.length; i++) {
                selectGS = selectGS + '<option value="' + arrayGS[0].tipos[i].valor + '">' + arrayGS[0].tipos[i].texto + '</option>'
            };

            $('#grupotipo').html(selectGS);

            if (!_bloqueaRecarga) { CambiaFiltro(); }
        } else {
            $('#grupotipo').html('<option value="">(All status group)</option>');
            porTres = true;
            if (!_bloqueaRecarga) { CambiaFiltro(); }
        }
    } else {
        porTres = true;
        $('#grupotipo').html('<option value="">(All status group)</option>');
    }
}

function CargaFiltrosHotelesAgencias() {
    var agencia = $('#agencias').val();
    var hotel = $('#hoteles').val();
    var arrayAgenciasAux = new Array();
    var arrayHotelesAux = new Array();
    var arrayHoteles = JSON.parse(localStorage.getItem('Hoteles'));
    var arrayAgencias = JSON.parse(localStorage.getItem('Agencias'));
    var opcSelect = '<option value="-1">(All hotels)</option>';
    var opcSelectAgencias = '<option value="-1">(All agencies)</option>';

    for (var i = 0; i < estructura.hoteles.length; i++) {
        var hotelActual = estructura.hoteles[i];

        arrayHotelesAux.push({
            codigo: hotelActual.codigo,
            nombre: hotelActual.nombre,
            alias: hotelActual.alias
        });

        for (var j = 0; j < hotelActual.agencias.length; j++) {
            var agenciaActual = hotelActual.agencias[j];

            arrayAgenciasAux.push({
                codigo: agenciaActual.codigoAgencia,
                nombre: agenciaActual.nombre
            })
        };
    };

    arrayAgencias = arrayAgencias.concat(arrayAgenciasAux);
    arrayAgencias = uniqBy(arrayAgencias, JSON.stringify);

    arrayHoteles = arrayHoteles.concat(arrayHotelesAux);
    arrayHoteles = uniqBy(arrayHoteles, JSON.stringify);

    localStorage.setItem('Agencias', JSON.stringify(arrayAgencias));
    localStorage.setItem('Hoteles', JSON.stringify(arrayHoteles));

    for (var i = 0; i < arrayAgencias.length; i++) {
        var agenciaActual = arrayAgencias[i];
        opcSelectAgencias = opcSelectAgencias + '<option value="' + i + '" data-codigo="' + agenciaActual.codigo + '">' + agenciaActual.nombre + '</option>'
    };

    for (var i = 0; i < arrayHoteles.length; i++) {
        opcSelect = opcSelect + '<option value="' + i + '" data-codigo="' + arrayHoteles[i].codigo + '">' + arrayHoteles[i].alias + '(' + arrayHoteles[i].nombre + ')</option>'
    }

    $('#hoteles').html(opcSelect);
    $('#agencias').html(opcSelectAgencias);

    $('#hoteles').val(hotel);
    $('#agencias').val(agencia);

    if (!$('#agencias').val()) {
        $('#agencias').val(-1);
        CambiaFiltro(4);
    } else {
        CambiaFiltro();
    }
}

function CargaOpcionesSelects() {
    var opcSelect = '<option value="-1">(All hoteles)</option>';
    var opcSelectAgencias = '<option value="-1">(All agencies)</option>';
    var opcSelectPeriodo = '';
    var opcSelectStatus = '<option value="">(All status)</option>';
    var opcSelectFechaTipo = '';
    var arrayAgencias = new Array();
    var arrayHoteles = new Array();
    var arrayPeriodos = [{ valor: 0, texto: "Weekly" }, { valor: 1, texto: "Montly" }, { valor: 2, texto: "Quarter" }];

    for (var i = 0; i < estructura.hoteles.length; i++) {
        var hotelActual = estructura.hoteles[i];

        arrayHoteles.push({
            codigo: hotelActual.codigo,
            nombre: hotelActual.nombre,
            alias: hotelActual.alias
        });

        opcSelect = opcSelect + '<option value="' + i + '" data-codigo="' + hotelActual.codigo + '">' + hotelActual.alias + '(' + hotelActual.nombre + ')</option>'

        for (var j = 0; j < hotelActual.agencias.length; j++) {
            var agenciaActual = hotelActual.agencias[j];

            arrayAgencias.push({
                codigo: agenciaActual.codigoAgencia,
                nombre: agenciaActual.nombre
            })
        };
    };

    for (var i = 0; i < estructura.status.length; i++) {
        var statusActual = estructura.status[i];

        arrayStatus.push({ valor: statusActual.id, texto: statusActual.nombre, tipos: [] });

        for (var j = 0; j < statusActual.titulos.length; j++) {

            arrayStatus[i].tipos.push({ valor: statusActual.idTitulos[j], texto: statusActual.titulos[j] });
        }
    };

    arrayAgencias = uniqBy(arrayAgencias, JSON.stringify);
    localStorage.setItem('Agencias', JSON.stringify(arrayAgencias));
    localStorage.setItem('Hoteles', JSON.stringify(arrayHoteles));

    for (var i = 0; i < arrayAgencias.length; i++) {
        var agenciaActual = arrayAgencias[i];
        opcSelectAgencias = opcSelectAgencias + '<option value="' + i + '" data-codigo="' + agenciaActual.codigo + '">' + agenciaActual.nombre + '</option>';
    };

    for (var i = 0; i < arrayPeriodos.length; i++) {
        var selected = (arrayPeriodos[i].valor == 1) ? 'selected=selected' : '';
        opcSelectPeriodo = opcSelectPeriodo + '<option value="' + arrayPeriodos[i].valor + '" ' + selected + '>' + arrayPeriodos[i].texto + '</option>';
    };

    for (var i = 0; i < arrayStatus.length; i++) {
        var selected = (arrayStatus[i].valor == '') ? 'selected=selected' : '';
        opcSelectStatus = opcSelectStatus + '<option value="' + arrayStatus[i].valor + '" ' + selected + '>' + arrayStatus[i].texto + '</option>';
    };

    for (var i = 0; i < arrayTipoFecha.length; i++) {
        opcSelectFechaTipo = opcSelectFechaTipo + '<option value="' + arrayTipoFecha[i].valor + '">' + arrayTipoFecha[i].texto + '</option>';
    };

    LlenaSelectGrupoStatus(true);

    $('#hoteles').html(opcSelect);
    $('#agencias').html(opcSelectAgencias);
    $('#tipoperiodo').html(opcSelectPeriodo);
    $('#statustipo').html(opcSelectStatus);
    $('#tipofecha').html(opcSelectFechaTipo);

    setTimeout(function () { $('.selectpicker').selectpicker(); }, 100);
}

function CambiaFiltroGrafica(_value, _tipoGrafica, _value2) {
    var agencia = $('#agencias').val();
    var hotel = $('#hoteles').val();

    if (_tipoGrafica == 'pie') {
        if ((hotel == -1 && agencia == -1) || (hotel > -1 && agencia > -1) || (agencia == -1 && hotel > -1)) {
            $('#agencias').val($('#agencias option[data-codigo="' + _value + '"]').attr('value'));
        } else if ((hotel == -1 && agencia > -1) || (hotel == -1 && agencia > -1)) {
            $('#hoteles').val($('#hoteles option[data-codigo="' + _value + '"]').attr('value'));
        }
        CambiaFiltro();
    } else if (_tipoGrafica == 'drill') {
        $('#statustipo').val(_value);
        LlenaSelectGrupoStatus(undefined);
    } else if (_tipoGrafica == 'drill2') {
        $('#statustipo').val(_value);
        LlenaSelectGrupoStatus(undefined, true);
        $('#grupotipo').val(_value2);
        CambiaFiltro();
    } else {
        if ((hotel == -1 && agencia == -1) || (hotel == -1 && agencia != -1) || (hotel != -1 && agencia != -1)) {
            $('#hoteles').val($('#hoteles option[data-codigo="' + _value + '"]').attr('value'));
        } else if (hotel != -1 && agencia == -1) {
            $('#agencias').val($('#agencias option[data-codigo="' + _value + '"]').attr('value'));
        }

        CambiaFiltro();
    }
}

function ReiniciaFiltros($elemento) {
    var tipoGrafica = $($elemento).attr('data-tipografica');
    var drill = $($elemento).attr('data-drill');

    if (tipoGrafica == 'pie' && drill == 'true') {
        $('#statustipo').val('');
        $('#tipofecha').val(2);
        porTres = true;
        LlenaSelectGrupoStatus(undefined);
    } else if (tipoGrafica == 'column' || (tipoGrafica == 'pie' && drill == '')) {
        var hotel = $('#hoteles').val();
        var agencia = $('#agencias').val();

        if (hotel != -1 && agencia == -1) {
            $('#hoteles').val(-1);
        } else if (hotel != -1 && agencia != -1) {
            $('#hoteles').val(-1);
            $('#agencias').val(-1);
        } else if (hotel == -1 && agencia != -1) {
            $('#agencias').val(-1);
        }

        CambiaFiltro();
    }
}

function EliminarFiltro(_elemento) {
    var $elemento = $(_elemento);
    var tipo = $elemento.attr('data-tipo');

    switch (tipo) {
        case 'hotel':
            $('#hoteles').val(-1);
            CambiaFiltro(4);
            break;
        case 'agencia':
            $('#agencias').val(-1);
            CambiaFiltro(4);
            break;
        case 'periodo':
            $('#tipoperiodo').val(1);
            CambiaFiltro(4);
            break;
        case 'tipofecha':
            $('#tipofecha').val(2);
            CambiaFiltro(4);
            break;
        case 'status':
            $('#statustipo').val('');
            LlenaSelectGrupoStatus(undefined, true);
            $('#grupotipo').val('');
            CambiaFiltro(4);
            break;
        case 'tipogrupo':
            $('#grupotipo').val('');
            CambiaFiltro(4);
            break;

    };
}

function CreaFiltrosSeleccionados() {
    $('#filtrosSeleccionados').html('');
    $('#filtrosSeleccionados').append(botonCTLPAST);
    //$('#filtrosSeleccionados').append(btnIrDetalle);

    var hotel = ($('#hoteles option:selected').attr('data-codigo')) ? $('#hoteles option:selected').attr('data-codigo') : '';
    var agencia = ($('#agencias option:selected').attr('data-codigo')) ? $('#agencias option:selected').attr('data-codigo') : '';
    var periodo = $('#tipoperiodo').val();
    var status = $('#statustipo').val();
    var date1 = $('#datetimepicker1').find(':first:input').val().replace(/\-/g, '');
    var date2 = $('#datetimepicker2').find(':first:input').val().replace(/\-/g, '');
    var tipoGrupo = $('#grupotipo').val();
    var tipofecha = ($('#tipofecha').val()) ? $('#tipofecha').val() : '';

    if (hotel != '') {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="hotel" onclick="EliminarFiltro(this);">' + $('#hoteles option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
    if (agencia != '') {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="agencia" onclick="EliminarFiltro(this);">' + $('#agencias option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
    if (periodo != 1) {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="periodo" onclick="EliminarFiltro(this);">' + $('#tipoperiodo option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
    if (tipofecha != 2) {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="tipofecha" onclick="EliminarFiltro(this);">' + $('#tipofecha option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
    if (status) {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="status" onclick="EliminarFiltro(this);">' + $('#statustipo option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
    if (tipoGrupo) {
        $('#filtrosSeleccionados').append('<div class="divFiltro"><span class="globos" data-tipo="tipogrupo" onclick="EliminarFiltro(this);">' + $('#grupotipo option:selected').text() + ' <span class="uiCloseButton">x</span></span></div>');
    }
}

function CambiaFiltro(_tipoFiltro) {
    $('#filtrosSeleccionados').html('');

    var hotel = ($('#hoteles option:selected').attr('data-codigo')) ? $('#hoteles option:selected').attr('data-codigo') : '';
    var agencia = ($('#agencias option:selected').attr('data-codigo')) ? $('#agencias option:selected').attr('data-codigo') : '';
    var periodo = $('#tipoperiodo').val();
    var status = $('#statustipo').val();
    var date1 = $('#datetimepicker1').find(':first:input').val().replace(/\-/g, '');
    var date2 = $('#datetimepicker2').find(':first:input').val().replace(/\-/g, '');
    var tipoGrupo = $('#grupotipo').val();
    var tipofecha = ($('#tipofecha').val()) ? $('#tipofecha').val() : '';

    CreaFiltrosSeleccionados();

    if ((date1 == '' && date2 != '') || (date2 == '' && date1 != '')) {
        alert('Select a range of dates.');
    } else {
        MuestraCargando();

        var parametros = '&hotel=' + hotel + '&agencia=' + agencia + '&tipoperiodo=' + periodo + '&statustipo=' + status + '&fini=' + date1 + '&ffin=' + date2 + '&statusgrupo=' + tipoGrupo + '&tipofecha=' + tipofecha;
        history.replaceState(null, null, '?' + parametros.substr(1));

        $.ajax({
            type: "POST",
            dataType: "json",
            url: consUrl + parametros
        }).done(function (data) {
            estructura = data;

            for (var i = 0; i < estructura.status.length; i++) {
                estructura.status[i].colores = $.grep(coloresStatus, function (e) { return e.id == estructura.status[i].id; })[0].color;
            };

            if (_tipoFiltro == 4) {
                CargaFiltrosHotelesAgencias();
            } else {
                if ($('#versus').is(":checked")) {
                    ActivaVersus($('#versus').is(":checked"));
                } else {
                    CargaGraficaDefault(false, OcultaCargando);
                }
            }
        });
    }

}

function DefaultsSelects(_pRecibidos) {
    if (_pRecibidos) {
        for (var i = 0; i < _pRecibidos.length; i++) {
            var tipo = _pRecibidos[i].parametro;

            switch (tipo) {
                case 'hotel':
                    $('#hoteles').val((_pRecibidos[i].valor == '') ? -1 : $('#hoteles option[data-codigo="' + _pRecibidos[i].valor + '"]').attr('value'));
                    break;
                case 'agencia':
                    $('#agencias').val((_pRecibidos[i].valor == '') ? -1 : $('#agencias option[data-codigo="' + _pRecibidos[i].valor + '"]').attr('value'));
                    break;
                case 'periodo':
                    $('#tipoperiodo').val(_pRecibidos[i].valor);
                    break;
                case 'tipofecha':
                    $('#tipofecha').val(_pRecibidos[i].valor);
                    break;
                case 'statustipo':
                    $('#statustipo').val(_pRecibidos[i].valor);
                    LlenaSelectGrupoStatus(undefined, true);
                    break;
                case 'statusgrupo':
                    $('#grupotipo').val(_pRecibidos[i].valor);
                    break;
            };
        };
    }
}

function CargaGraficaDefault(_primeraVez, _fn, _params) {
    var hotel = ($('#hoteles option:selected').attr('data-codigo')) ? $('#hoteles option:selected').attr('data-codigo') : '';
    var agencia = ($('#agencias option:selected').attr('data-codigo')) ? $('#agencias option:selected').attr('data-codigo') : '';
    var segundaGrafica = true;
    var tCompColumn = '';
    var tCompPie = '';
    var colorHotel = '';

    if ((!_params) || (_params && !_params.versus)) {
        if (hotel != '' && agencia == '') {
            segundaGrafica = true;
        }

        if (_primeraVez && _params) {
            CargaOpcionesSelects();
            DefaultsSelects(_params.pRecibidos);
        }

        var jsonDatos = generaJsonDatos({ tipo: 'column', obj: estructura });
        var jsonDatosColumnas3D = generaJsonDatos({ tipo: 'columnTotales', obj: estructura });
        var jsonDatosPie = generaJsonDatos({ tipo: 'pie', obj: estructura });
        var jsonDatosPieDrill = generaJsonDatos({ tipo: 'pieDrill', obj: estructura });

        if (_primeraVez) {
            Graficas.CreaDiv({ destinoGrafica: 'Drill', tipoGrafica: 'pie', drill: true });
            Graficas.CreaDiv({ destinoGrafica: 'PCT', tipoGrafica: 'pie', tieneTabla: true });
            Graficas.CreaDiv({ destinoGrafica: 'VentasProperties', tipoGrafica: 'column', tieneTabla: true });
            Graficas.CreaDiv({ destinoGrafica: 'Ventas', tipoGrafica: 'column', tieneTabla: true, periodo: true });
        }

        if ((hotel == '' && agencia == '') || (hotel != '' && agencia != '')) {
            tCompColumn = 'Hotel ';
            tCompPie = 'Agency ';
        } else if (hotel != '' && agencia == '') {
            colorHotel = '#' + estructura.hoteles[0].color;
            tCompColumn = 'Agency ';
            tCompPie = 'Agency ';
        } else if (hotel == '' && agencia != '') {
            tCompColumn = 'Hotel ';
            tCompPie = 'Hotel ';
        }

        if (hotel != '' && agencia != '') {
            colorHotel = (estructura.hoteles.length > 0) ? '#' + estructura.hoteles[0].color : '';
        }

        Graficas.CargaGrafica({ destinoGrafica: 'Drill', tituloReporte: 'Overview by status', tipoGrafica: 'pie', json: jsonDatosPieDrill, yTitulo: '', xTitulo: '', drill: true });
        Graficas.CargaGrafica({ destinoGrafica: 'PCT', tituloReporte: tCompPie + 'Overall Production', tipoGrafica: 'pie', json: jsonDatosPie, yTitulo: '', xTitulo: '', activa3D: true, tieneTabla: true, tablaTotales: true });
        Graficas.CargaGrafica({ destinoGrafica: 'VentasProperties', tituloReporte: tCompColumn + 'Totals Overview', tipoGrafica: 'column', json: jsonDatosColumnas3D, yTitulo: '', xTitulo: '', muestraLabels: '0', activa3D: true, tieneTabla: true, tablaTotales: true, plotLines: true });
        Graficas.CargaGrafica({ destinoGrafica: 'Ventas', tituloReporte: tCompColumn + 'Summary per periods', tipoGrafica: 'column', json: jsonDatos, yTitulo: 'Properties', xTitulo: 'Months', muestraLabelsColumna: '0', activa3D: true, tieneTabla: true, segundaGrafica: segundaGrafica, colorHotel: colorHotel });

        if (estructura.hoteles.length == 1 && _primeraVez) {
            $('#hoteles').val($('#hoteles option[data-codigo="' + estructura.hoteles[0].codigo + '"]').attr('value'));
        }

        CreaFiltrosSeleccionados();

        $('#url').val(window.location.href);
    } else {
        var jsonDatos = generaJsonDatos({ tipo: 'columnVersus', obj: _params.estructura2 });
        var jsonDatosColumnas3D = generaJsonDatos({ tipo: 'columnTotalesVersus', obj: _params.estructura2 });
        var jsonDatosPie = generaJsonDatos({ tipo: 'pieVersus', obj: _params.estructura2 });
        var jsonDatosPieDrill = generaJsonDatos({ tipo: 'pieDrill', obj: estructura });
        var jsonDatosPieDrill2 = generaJsonDatos({ tipo: 'pieDrill', obj: _params.estructura2 });

        Graficas.CargaGrafica({ destinoGrafica: 'Ventas', tituloReporte: tCompColumn + 'Summary per periods', tipoGrafica: 'column', json: jsonDatos, yTitulo: 'Properties', xTitulo: 'Months', muestraLabelsColumna: '0', activa3D: true, tieneTabla: true, colorHotel: colorHotel, versus: true, versusGrafica: 'line' });
        Graficas.CargaGrafica({ destinoGrafica: 'VentasProperties', tituloReporte: tCompColumn + 'Totals Overview', tipoGrafica: 'column', json: jsonDatosColumnas3D, yTitulo: '', xTitulo: '', muestraLabels: '0', activa3D: true, tieneTabla: true, tablaTotales: true, versus: true });
        Graficas.CargaGrafica({ destinoGrafica: 'PCT', tituloReporte: tCompPie + 'Overall Production', tipoGrafica: 'pie', json: jsonDatosPie, yTitulo: '', xTitulo: '', activa3D: true, tieneTabla: true, tablaTotales: true, versus: true });
        Graficas.CargaGrafica({ destinoGrafica: 'Drill', tituloReporte: 'Overview by status', tipoGrafica: 'pie', json: jsonDatosPieDrill, json2: jsonDatosPieDrill2, yTitulo: '', xTitulo: '', drill: true, versus: true });
    }

    _fn();
}

function generaJsonDatos(obj) {
    var estructuraDatos = obj.obj;
    var jsonDatos = {};
    var hoteles = $('#hoteles').val();
    var agencias = $('#agencias').val();

    jsonDatos.categorias = new Array();
    jsonDatos.datos = new Array();

    if (obj.tipo == 'pieDrill') {

        for (var i = 0; i < estructuraDatos.status.length; i++) {
            statusActual = estructuraDatos.status[i];

            if (statusActual.total) {
                jsonDatos.categorias.push(statusActual.nombre);
                jsonDatos.datos.push({
                    drilldown: {
                        categories: statusActual.titulos,
                        data: statusActual.total,
                        name: statusActual.nombre,
                        idsData: statusActual.idTitulos,
                        id: statusActual.id,
                        colorDato: statusActual.colores,
                        coloresDatos: statusActual.color
                    }
                });

                var sumatotales = 0;

                for (var j = 0; j < statusActual.total.length; j++) {
                    sumatotales = sumatotales + statusActual.total[j];
                };

                jsonDatos.datos[i].y = sumatotales;
            }
        };
    } else if (obj.tipo == 'pie') {

        var arrayAgencias = new Array();

        if (((!hoteles && !agencias) || (hoteles && !agencias)) || ((hoteles == -1 && agencias == -1) || (hoteles > -1 && agencias == -1)) || (hoteles > -1 && agencias > -1)) {
            for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                var hotelActual = estructuraDatos.hoteles[i];

                for (var j = 0; j < hotelActual.agencias.length; j++) {
                    var agenciaActual = hotelActual.agencias[j];
                    var sumaTotalAgencia = 0;

                    for (var k = 0; k < agenciaActual.total.length; k++) {
                        sumaTotalAgencia = sumaTotalAgencia + agenciaActual.total[k];
                    };

                    arrayAgencias.push({
                        name: agenciaActual.nombre,
                        codigo: agenciaActual.codigoAgencia,
                        alias: agenciaActual.codigoAgencia,
                        nPie: agenciaActual.nombre,
                        y: sumaTotalAgencia
                    });
                };
            };

            arrayAgencias = arrayAgencias.sort(compare);
            var totalAgencias = 0;
            var codigoAgenciaAnt = '';

            for (var i = 0; i < arrayAgencias.length; i++) {
                var agenciaActual = arrayAgencias[i];

                if (agenciaActual.codigo != codigoAgenciaAnt) {
                    codigoAgenciaAnt = agenciaActual.codigo;
                    totalAgencias = agenciaActual.y;

                    jsonDatos.datos.push({
                        name: agenciaActual.name,
                        codigo: agenciaActual.codigo,
                        alias: agenciaActual.codigo,
                        nPie: agenciaActual.name,
                        y: totalAgencias
                    });
                } else {
                    codigoAgenciaAnt = agenciaActual.codigo;
                    totalAgencias = totalAgencias + agenciaActual.y;

                    jsonDatos.datos[jsonDatos.datos.length - 1].y = totalAgencias;
                }
            };
        } else if (hoteles == -1 && agencias > -1) {
            for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                var hotelActual = estructuraDatos.hoteles[i];
                var sumaTotal = 0;

                for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                    sumaTotal = sumaTotal + hotelActual.totalesPeriodo[j];
                }

                jsonDatos.datos.push({
                    name: hotelActual.nombre,
                    codigo: hotelActual.codigo,
                    alias: hotelActual.alias,
                    nPie: hotelActual.alias,
                    y: sumaTotal,
                    color: '#' + hotelActual.color
                });
            };
        }

        var sumaTotal = 0;

        for (var i = 0; i < jsonDatos.datos.length; i++) {
            var datoActual = jsonDatos.datos[i];

            sumaTotal = sumaTotal + datoActual.y;
        };

        for (var i = 0; i < jsonDatos.datos.length; i++) {
            var datoActual = jsonDatos.datos[i];
            var pctActual = (datoActual.y / sumaTotal) * 100;
            datoActual.pct = pctActual;
        };
    } else if (obj.tipo == 'columnTotales') {
        if (estructuraDatos.hoteles.length > 0) {
            if (hoteles > -1 && agencias == -1) {
                for (var i = 0; i < estructuraDatos.hoteles[0].agencias.length; i++) {
                    var hotelActual = estructuraDatos.hoteles[0].agencias[i];

                    jsonDatos.datos.push({
                        codigo: hotelActual.codigoAgencia,
                        name: hotelActual.nombre,
                        nombreReal: hotelActual.nombre,
                        data: new Array()
                    });

                    var sumaTotal = 0;

                    for (var j = 0; j < hotelActual.total.length; j++) {
                        periodoActual = hotelActual.total[j];
                        sumaTotal = sumaTotal + periodoActual;
                    };

                    jsonDatos.datos[i].data[0] = { y: sumaTotal, alias: hotelActual.codigoAgencia, codigo: hotelActual.codigoAgencia, nombreReal: hotelActual.nombre };
                };
            } else {
                for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                    var hotelActual = estructuraDatos.hoteles[i];

                    jsonDatos.datos.push({
                        codigo: hotelActual.codigo,
                        color: '#' + hotelActual.color,
                        name: hotelActual.alias,
                        nombreReal: hotelActual.nombre,
                        data: new Array()
                    });

                    var sumaTotal = 0;

                    for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                        periodoActual = hotelActual.totalesPeriodo[j];
                        sumaTotal = sumaTotal + periodoActual;
                    };

                    jsonDatos.datos[i].data[0] = { y: sumaTotal, alias: hotelActual.alias, codigo: hotelActual.codigo, nombreReal: hotelActual.nombre };
                };
            }

            var sumaTotal = 0;

            for (var i = 0; i < jsonDatos.datos.length; i++) {
                var datoActual = jsonDatos.datos[i];

                sumaTotal = sumaTotal + datoActual.data[0].y;
            };

            for (var i = 0; i < jsonDatos.datos.length; i++) {
                var datoActual = jsonDatos.datos[i];
                var pctActual = (datoActual.data[0].y / sumaTotal) * 100;
                datoActual.data[0].pct = pctActual;
            };

            jsonDatos.plotLines = new Array();
            jsonDatos.plotLines.push([{ value: sumaTotal, color: 'red', width: 1 }]);

            jsonDatos.datos.push({ codigo: "Total", name: "Total", color: "#262A0F", nombreReal: "Total", visible: false, data: [{ alias: "Total", codigo: "Total", nombreReal: "Total", y: sumaTotal, click: 0, pct: 100 }] });
        }
    } else if (obj.tipo == 'column') {
        var visible = true;
        jsonDatos.categorias = estructuraDatos.nombrePeriodo;

        if ((hoteles == -1 && agencias == -1) || (!hoteles && !agencias)) {
            visible = true;
        } else if (hoteles > -1 && agencias > -1) {
            visible = false;
        }

        if (estructuraDatos.hoteles.length > 0) {
            if (hoteles > -1 && agencias == -1) {
                for (var i = 0; i < estructuraDatos.hoteles[0].agencias.length; i++) {
                    var hotelActual = estructuraDatos.hoteles[0].agencias[i];
                    var data = new Array();

                    jsonDatos.datos.push({
                        codigo: hotelActual.codigoAgencia,
                        name: hotelActual.nombre,
                        nombreReal: hotelActual.nombre,
                        data: new Array(),
                        visible: visible
                    });

                    for (var j = 0; j < hotelActual.total.length; j++) {
                        periodoActual = hotelActual.total[j];
                        jsonDatos.datos[i].data.push({ y: periodoActual, alias: hotelActual.codigoAgencia, codigo: hotelActual.codigoAgencia, nombreReal: hotelActual.nombre });
                    };
                };
            } else {
                for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                    var hotelActual = estructuraDatos.hoteles[i];
                    var data = new Array();

                    jsonDatos.datos.push({
                        codigo: hotelActual.codigo,
                        color: '#' + hotelActual.color,
                        name: hotelActual.alias,
                        nombreReal: hotelActual.nombre,
                        data: new Array(),
                        visible: visible
                    });

                    for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                        periodoActual = hotelActual.totalesPeriodo[j];
                        jsonDatos.datos[i].data.push({ y: periodoActual, alias: hotelActual.alias, codigo: hotelActual.codigo, nombreReal: hotelActual.nombre });
                    };
                };
            }
        }
    } else if (obj.tipo == 'columnVersus') {
        var visible = true;
        jsonDatos.categorias = estructura.nombrePeriodo;
        var anioIni = moment($('#datetimepicker2').find(':first:input').val()).format('YYYY');
        var anioFin = moment($('#datetimepicker2').find(':first:input').val()).subtract(1, 'years').format('YYYY');
        var arrayTotales2 = [];
        var arrayTotales = [];

        if ((hoteles == -1 && agencias == -1) || (!hoteles && !agencias)) {
            visible = true;
        } else if (hoteles > -1 && agencias > -1) {
            visible = false;
        }

        if (estructura.hoteles.length > 0) {

            for (var i = 0; i < estructura.hoteles.length; i++) {
                var hotelActual = estructura.hoteles[i];

                for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                    periodoActual = hotelActual.totalesPeriodo[j];
                    var totalAnt = (arrayTotales[j]) ? (arrayTotales[j].y) : 0;
                    var y = totalAnt + periodoActual;

                    arrayTotales[j] = { y: y, alias: anioIni, codigo: anioIni, nombreReal: anioIni, click: 0 };
                };
            };

            for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                var hotelActual = estructuraDatos.hoteles[i];

                for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                    periodoActual = hotelActual.totalesPeriodo[j];
                    var totalAnt = (arrayTotales2[j]) ? (arrayTotales2[j].y) : 0;
                    var y = totalAnt + periodoActual;

                    arrayTotales2[j] = { y: y, alias: anioFin, codigo: anioFin, nombreReal: anioFin, click: 0 };
                };
            };

            jsonDatos.datos.push({
                codigo: anioIni,
                color: '#7F2626',
                name: anioIni,
                nombreReal: anioIni,
                data: arrayTotales,
                visible: visible
            });

            jsonDatos.datos.push({
                codigo: anioFin,
                color: '#00B233',
                name: anioFin,
                nombreReal: anioFin,
                data: arrayTotales2,
                visible: visible
            });
        }
    } else if (obj.tipo == 'columnTotalesVersus') {
        var anioIni = moment($('#datetimepicker2').find(':first:input').val()).format('YYYY');
        var anioFin = moment($('#datetimepicker2').find(':first:input').val()).subtract(1, 'years').format('YYYY');
        var sumaTotal = 0;
        var sumaTotal2 = 0

        if (estructuraDatos.hoteles.length > 0) {

            for (var i = 0; i < estructura.hoteles.length; i++) {
                var hotelActual = estructura.hoteles[i];

                for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                    periodoActual = hotelActual.totalesPeriodo[j];
                    sumaTotal = sumaTotal + periodoActual;
                };

            };

            for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
                var hotelActual = estructuraDatos.hoteles[i];

                for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                    periodoActual = hotelActual.totalesPeriodo[j];
                    sumaTotal2 = sumaTotal2 + periodoActual;
                };

            };
        }

        jsonDatos.datos.push({ codigo: "Total " + anioIni, name: "Total " + anioIni, color: "", nombreReal: "Total " + anioIni, data: [{ alias: "Total " + anioIni, codigo: "Total " + anioIni, nombreReal: "Total " + anioIni, y: sumaTotal, click: 0, pct: 100 }], color: "#7F2626" });
        jsonDatos.datos.push({ codigo: "Total " + anioFin, name: "Total " + anioFin, color: "", nombreReal: "Total " + anioFin, data: [{ alias: "Total " + anioFin, codigo: "Total " + anioFin, nombreReal: "Total " + anioFin, y: sumaTotal2, click: 0, pct: 100 }], color: "#00B233" });
    } else if (obj.tipo == 'pieVersus') {
        var anioIni = moment($('#datetimepicker2').find(':first:input').val()).format('YYYY');
        var anioFin = moment($('#datetimepicker2').find(':first:input').val()).subtract(1, 'years').format('YYYY');
        var sumaTotal = 0;
        var sumaTotal2 = 0

        for (var i = 0; i < estructura.hoteles.length; i++) {
            var hotelActual = estructura.hoteles[i];

            for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                periodoActual = hotelActual.totalesPeriodo[j];
                sumaTotal = sumaTotal + periodoActual;
            };

        };

        for (var i = 0; i < estructuraDatos.hoteles.length; i++) {
            var hotelActual = estructuraDatos.hoteles[i];

            for (var j = 0; j < hotelActual.totalesPeriodo.length; j++) {
                periodoActual = hotelActual.totalesPeriodo[j];
                sumaTotal2 = sumaTotal2 + periodoActual;
            };

        };

        jsonDatos.datos.push({
            name: anioIni,
            codigo: anioIni,
            alias: anioIni,
            nPie: anioIni,
            y: sumaTotal,
            pct: 100,
            color: "#7F2626",
            click: 0
        });

        jsonDatos.datos.push({
            name: anioFin,
            codigo: anioFin,
            alias: anioFin,
            nPie: anioFin,
            y: sumaTotal2,
            pct: 100,
            color: "#00B233",
            click: 0
        });
    }

    return JSON.stringify(jsonDatos);
}

var OcultaCargando = function () {
    $('.load-container').fadeOut('slow');
};

var MuestraCargando = function () {
    $('.load-container').fadeIn('slow');
};

var OcultarDatos = function () {
    var chart = $('#Ventas').highcharts();
    var series = chart.series[0];

    $(chart.series).each(function () {
        if (!this.options.dejarVisible) {
            if (this.visible) {
                this.setVisible(false, false);
            } else {
                this.setVisible(true, false);
            }
        }
    });
};

function ActivaVersus(_state) {
    MuestraCargando();

    if (_state) {
        var valor1 = $('#datetimepicker1').find(':first:input').val();
        var valor2 = $('#datetimepicker2').find(':first:input').val();
        var valor1P = moment(valor1).subtract(1, 'years').format('YYYY-MM-DD');
        var valor2P = moment(valor2).subtract(1, 'years').format('YYYY-MM-DD');
        var getParams = $_GET();
        var params = '';
        var estructura2 = {};

        if (getParams) {
            for (var i = 0; i < getParams.length; i++) {
                if (getParams[i].parametro != 'fini' && getParams[i].parametro != 'ffin') {
                    params = params + '&' + getParams[i].parametro + '=' + getParams[i].valor;
                }
            };

            params = params + '&fini=' + valor1P.replace(/\-/g, '') + '&ffin=' + valor2P.replace(/\-/g, '');


        } else {
            params = '&fini=' + valor1P.replace(/\-/g, '') + '&ffin=' + valor2P.replace(/\-/g, '');
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: consUrl + params
        }).done(function (data) {
            estructura2 = data;
            CargaGraficaDefault(false, OcultaCargando, { estructura2: estructura2, versus: true });
        });
    } else {
        CargaGraficaDefault(false, OcultaCargando);
    }
}

$(function () {
    $('#filtros').append('<input style="display:none;" value="" id="url"/>');

    var fechaIni = moment().startOf('year').format('YYYY-MM-DD');
    var fechaFin = moment().endOf('year').format('YYYY-MM-DD');
    var params = '';
    var getParams = $_GET();
    var fini = $_GET('fini');

    $('#datetimepicker1').datetimepicker({ format: 'YYYY-MM-DD', defaultDate: fechaIni });
    $('#datetimepicker2').datetimepicker({ format: 'YYYY-MM-DD', defaultDate: fechaFin });
    $("#datetimepicker1").on("dp.change", function (e) {
        $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
    });

    $("#datetimepicker2").on("dp.change", function (e) {
        $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
    });

    $("#datetimepicker1").on("dp.hide", function (e) {
        var valor1 = $('#datetimepicker1').find(':first:input').val();
        var valor2 = $('#datetimepicker2').find(':first:input').val();

        if (valor1 != '' && valor2 != '') { CambiaFiltro(); }
    });

    $("#datetimepicker2").on("dp.hide", function (e) {
        var valor1 = $('#datetimepicker1').find(':first:input').val();
        var valor2 = $('#datetimepicker2').find(':first:input').val();

        if (valor1 != '' && valor2 != '') { CambiaFiltro(); }
    });

    $("#versus").bootstrapSwitch();

    $("#versus").on('switchChange.bootstrapSwitch', function (event, state) {
        ActivaVersus(state);
    });

    if (getParams) {
        for (var i = 0; i < getParams.length; i++) {
            params = params + '&' + getParams[i].parametro + '=' + getParams[i].valor;
        };

        if (!fini) {
            params = params + '&fini=' + fechaIni.replace(/\-/g, '') + '&ffin=' + fechaFin.replace(/\-/g, '');
        }
    } else {
        params = '&fini=' + fechaIni.replace(/\-/g, '') + '&ffin=' + fechaFin.replace(/\-/g, '');
    }

    $.ajax({
        type: "POST",
        dataType: "json",
        url: consUrl + params
    }).done(function (data) {
        estructura = data;

        for (var i = 0; i < estructura.status.length; i++) {
            estructura.status[i].colores = $.grep(coloresStatus, function (e) { return e.id == estructura.status[i].id; })[0].color;
        };

        CargaGraficaDefault(true, OcultaCargando, { pRecibidos: getParams });
    });
});