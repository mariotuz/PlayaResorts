$(document).ready(function() {
    
    //var inputs = 1; 
    
    //$('#btnAdd').click(function() {
    //    $('.btnDel:disabled').removeAttr('disabled');
    //    var c = $('.clonedInput:first').clone(true);
    //        c.children(':text').attr('name','input'+ (++inputs) );
    //    $('.clonedInput:last').after(c);
    //});
    
    //$('.btnDel').click(function() {
    //    //if (confirm('continue delete?')) {
    //      //  --inputs;
    //        $(this).closest('.clonedInput').remove();
    //        $('.btnDel').attr('disabled',($('.clonedInput').length  < 2));
        
    //});

    //var inputs = 1; 
    
    //$('#btnAddos').click(function() {
    //    $('.btnDeldos:disabled').removeAttr('disabled');
    //    var c = $('.clonedInputdos:first').clone(true);
    //        c.children(':text').attr('name','input'+ (++inputs) );
    //    $('.clonedInputdos:last').after(c);
    //});
    
    //$('.btnDeldos').click(function() {
    //    //if (confirm('continue delete?')) {
    //      //  --inputs;
    //        $(this).closest('.clonedInputdos').remove();
    //        $('.btnDeldos').attr('disabled',($('.clonedInputdos').length  < 2));
        
    //});

    //add email distribution catalog



    var inputsedit = 1;

    $('#btnAddmailedit').click(function () {
        $('.btnDelmailedit:disabled').removeAttr('disabled');
        var c = $('.clonedInputmailEdit:first').clone(true);
        c.children(':text').attr('name', 'input' + (++inputsedit));
        $('.clonedInputmailEdit:last').after(c);
    });

    $('.btnDelmailedit').click(function () {
        //if (confirm('continue delete?')) {
        //  --inputs;
        $(this).closest('.clonedInputmailEdit').remove();
        $('.btnDelmailedit').attr('disabled', ($('.clonedInputmailEdit').length < 2));

    });

    var inputsbreak = 1; 
    
    $('#btnAddmail').click(function() {
        $('.btnDelmail:disabled').removeAttr('disabled');
        var c = $('.clonedInputmail:first').clone(true);
        c.children(':text').attr('name', 'input' + (++inputsbreak));
        $('.clonedInputmail:last').after(c);
    });
    
    $('.btnDelmail').click(function() {
        //if (confirm('continue delete?')) {
          //  --inputs;
            $(this).closest('.clonedInputmail').remove();
            $('.btnDelmail').attr('disabled',($('.clonedInputmail').length  < 2));
        
    });



   



    //var inputs = 1; 
    
    //$('#btnAddmailMod').click(function() {
    //    $('.btnDelmailMod:disabled').removeAttr('disabled');
    //    var c = $('.clonedInputmailMod:first').clone(true);
    //        c.children(':text').attr('name','input'+ (++inputs) );
    //    $('.clonedInputmailMod:last').after(c);
    //});
    
    //$('.btnDelmailMod').click(function() {
    //    //if (confirm('continue delete?')) {
    //      //  --inputs;
    //        $(this).closest('.clonedInputmailMod').remove();
    //        $('.btnDelmailMod').attr('disabled',($('.clonedInputmailMod').length  < 2));
        
    //});

    
});