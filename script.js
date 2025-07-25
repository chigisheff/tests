    var colorSpan;
    var colorInput;
    $(document).ready(function(){
        colorSpan = $('#counter').css('color');
        colorInput = $('[data-set="alias"]').css('color');
    });
// Функция фильтрации
    function CAT_ADM_KeyUp(e, eto, fun, opt) {
        const out = '/16';
        var valueInput = $(eto).val();
        if(/[а-яА-ЯЁё]/.test(valueInput)){
            $(eto).css('color','red');
        } else {
            $(eto).css('color',colorInput);
        }
            
        $('#counter').text(valueInput.length+out);
        if(valueInput.length > 16){
            $('#counter').css('color','red');
        }else{
            $('#counter').css('color',colorSpan);
        }
        
        var e = e || window.event;
        var fun = (fun ? fun : 'CAT_ADM_Auth');
        if (e.keyCode == 13) {
            window[fun](opt ? opt : eto);
        }
    }
    function CAT_ADM_Auth(eto) {
        EXPORT_MODAL();
        var opt = { auth_init: 1 };
        var par = $(eto).parent();
        opt['log'] = $(par).find('[name="log"]').val();
        opt['pas'] = $(par).find('[name="pas"]').val();
        opt['token_access'] = sessionStorage.getItem('token_access');
        $.post(H_ARR['hos'] + '/catalog/adm/get.php', opt, function (json) {
            EXPORT_MODAL({ text: json['title'], fade: (json['error'] ? 3600 : 200) });
            if (!json['error']) {
                //EXPORT_ADD_COOKIE({ name: 'authsid', val: json['sid'], time: 7776000 });
                setTimeout(() => { location.reload(); }, 200);
                }
        }, 'json');
    }