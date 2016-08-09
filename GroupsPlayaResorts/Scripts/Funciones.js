FormatoNumero = function (valor, decimales) {
    if (!isNaN(parseFloat(valor)) || ('' + valor != 'N/A')) {
        var SysSepMiles = ',';
        var SysSepDecimales = '.';

        return accounting.formatNumber(valor, decimales, SysSepMiles, SysSepDecimales);
    }
    else
        return valor;
}

FormatoMoneda = function (valor, decimales) {
    if (!isNaN(parseFloat(valor)) || ('' + valor != 'N/A')) {
        var SysSepMiles = ',';
        var SysSepDecimales = '.';

        return accounting.formatMoney(valor, "$", decimales, ",", ".");
    }
    else
        return valor;
}


Formatea = function () {

    $('.S').each(function (index, value) {
        if ($(this).hasClass('Total'))
            $(this).text(FormatoMoneda($(this).text(), 2))
        else
            $(this).text(FormatoNumero($(this).text(), 2))
        });

    $('.C').each(function (index, value) {
        if ($(this).hasClass('Total'))
            $(this).text(FormatoMoneda($(this).text(), 0))
        else
            $(this).text(FormatoNumero($(this).text(), 0))
        });
}


//Mensajes
MSG = function (mensaje) {
    var idelemento = CreaIdAleatorio();
    $("body").prepend('<div class="alertUl alert-error alert' + idelemento + '"><strong>Error! </strong>' + mensaje + '</div>');
    $('.alert' + idelemento).fadeIn("slow").delay(2000).fadeOut("slow");
    setTimeout(function () { $('.alert' + idelemento).remove(); }, 4000);
}

Valida_Descuento_Usuario = function () {
    $('#DiscountRate').keypress(function (event) {


        if (event.keyCode == 13) {

            var valor = $('#DiscountRate').val()

            if (valor <= 10)
                $('#ConsultRevenue').click();
            else {
                event.preventDefault();
                MSG('Invalid percentage discount');
            }
        }
    });

}