var _Validaciones = '';

function isDate(txtDate) {
    var currVal = txtDate;
    if (currVal == '')
        return false;

    var rxDatePattern = /^(\d{1,4})(\/|-)(\d{1,2})(\/|-)(\d{2})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null)
        return false;

    //Checks for yyyy/mm/dd format.
    dtMonth = dtArray[3];
    dtDay = dtArray[5];
    dtYear = dtArray[1];

    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay > 31)
        return false;
    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
        return false;
    else if (dtMonth == 2) {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay > 29 || (dtDay == 29 && !isleap))
            return false;
    }
    return true;
}
function CreaIdAleatorio() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < 5; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}


function Validaciones() {
    this.arrayControles = ['SELECT', 'INPUT', 'TEXTAREA'];
}

Validaciones.prototype.ValidaCampo = function (_elemento) {
    var tipoElemento = typeof _elemento;
    var $elemento = (tipoElemento == 'string') ? $('#' + _elemento) : $(_elemento);
    var msg = '';
    var tipoValidacion = $elemento.attr('data-validacion');
    var idelemento = CreaIdAleatorio();
    var valor = $elemento.val();
    var error = false;
    var msgError = '';

    if (tipoValidacion == 'fecha') {
        if (valor != '' && !isDate(valor)) {
            error = true;
            msgError = 'please check the date.';
        }
    } else if (tipoValidacion == 'numero') {
        if (valor.length > 0 && isNaN(valor)) {
            error = true;
            msgError = 'write a valid number.';
        }
    } else if (tipoValidacion == 'vacio') {
        if (valor == '') {
            error = true;
            msgError = 'please type something.';
        }
    }

    msgError = ($elemento.attr('data-msgValidacion')) ? $elemento.attr('data-msgValidacion') : msgError;

    if (error) {
        $elemento.addClass('errorInput').val('');

        setTimeout(function () { $elemento.removeClass('errorInput'); }, 2000);

        $("body").prepend('<div class="alertUl alert-error alert' + idelemento + '"><strong>Error!</strong> ' + msgError + '</div>');
        $('.alert' + idelemento).fadeIn("slow").delay(2000).fadeOut("slow");

        setTimeout(function () { $('.alert' + idelemento).remove(); }, 4000);

        $elemento.focus();
    }

    if (tipoElemento == 'string') {
        return error;
    }
}

Validaciones.prototype.ValidaObligatorios = function (_formId) {
    var vacios = 0;
    var respuesta = true;
    var idelemento = CreaIdAleatorio();
    var arrayControles = this.arrayControles;
    var formObligatorios = (_formId) ? '#' + _formId + ' ' : '';

    $(formObligatorios + '.obligatorio').each(function (e) {
        var $elemento = $(this);
        var tag = $elemento[0].tagName;
        var existe = arrayControles.indexOf(tag);

        if (existe >= 0 && $elemento.val() == '') {
            $elemento.addClass('errorInput elemento' + idelemento);
            setTimeout(function () { $('.elemento' + idelemento).removeClass('errorInput'); $('.elemento' + idelemento).removeClass('elemento' + idelemento); }, 2000);
            vacios++;
        }
    });

    $(formObligatorios + '.vaciar').each(function (e) {
        var $elemento = $(this);
        $elemento.val('');
    });

    if (vacios > 0) {
        $("body").prepend('<div class="alertUl alert-error alert' + idelemento + '"><strong>Error!</strong> The marked fields are required.</div>');
        $('.alert' + idelemento).fadeIn("slow").delay(2000).fadeOut("slow");

        setTimeout(function () { $('.alert' + idelemento).remove(); }, 4000);

        respuesta = false;
    }

    return respuesta;
};

Validaciones.prototype.MuestraMSG = function (_msg) {
    var idelemento = CreaIdAleatorio();
    $("body").prepend('<div class="alertUl alert-error alert' + idelemento + '"><strong>Error!</strong> ' + _msg + '</div>');
    $('.alert' + idelemento).fadeIn("slow").delay(2000).fadeOut("slow");

    setTimeout(function () { $('.alert' + idelemento).remove(); }, 4000);
}

function i18nF(s) {
    var bits = s.split('%');
    var out = bits[0];
    var re = /^([ds])(.*)$/;
    for (var i = 1; i < bits.length; i++) {
        p = re.exec(bits[i]);
        if (!p || arguments[i] == null) continue;
        if (p[1] == 'n') {
            out += parseInt(arguments[i], 10);
        } else if (p[1] == 's') {
            out += arguments[i];
        }
        out += p[2];
    }
    return out;
}

$(function () {
    _Validaciones = new Validaciones();
});