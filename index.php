<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест 5</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/js/select2.min.js"></script>
    <script src="/script.js"></script>
    
</head>
<body>
    <div style="margin:auto; max-width: 350px;">
    <div class="mod export_mod_text ex_imgbox" style="z-index:2; min-width:120px; max-width:100%; max-height:100%; overflow:auto;">
        <div class="ex_rel bg" style="padding:20px; min-width:300px;">
        <input type="hidden" name="update" value="129">
        <label>Изменить параметры</label><br>
        <div class="ex_rel" style="height:15px;">   
        </div><label>
            <b style="color:#777;">title</b> (название)
        </label>
        <div class="ex_rel" style="height:5px;">
        </div><input type="text" data-set="title;"  maxlength="10" value="sdfsdfwefrf" onkeyup="CAT_ADM_KeyUp(event, this, `CAT_ADM_DOPPARAM_Enter`)" style="width:100%;">
        <div class="ex_rel" style="height:15px;"></div>
        <label style="color:#777;">Тип инпута в фильтре</label>
        <div class="ex_rel" style="height:5px;"></div>
        <select class="adm_dopparam_select" name="type" data-set="type" style="width:100%;" onchange="CAT_ADM_DOPPARAM_Select(this, 129)">
            <option value="1">Список</option>
            <option value="2">Диапазон</option></select>
        <div class="ex_rel" style="height:15px;"></div>
            <label><b style="color:#777;">alias</b> пример: <b>sometext</b> (макс. 16 символов, латиница) <br>уникальный ключ-идентификатор, повторить на основном</label>
            <div class="ex_rel" style="height:5px;"></div>
            <div style="position: relative; width: 318px;">
                <span id="counter" style="border-bottom: 1px solid #f5f5f5;position: absolute; bottom: 25px; right: 0; width: 25px;">0/16</span>
                <input type="text" data-set="alias" value=""  maxlength="17" onkeyup="CAT_ADM_KeyUp(event, this, `CAT_ADM_DOPPARAM_Enter`)" style="width:100%;">
            </div>
            <div class="ex_rel" style="height:15px;"></div>
            <label><b style="color:#777;">bitrix</b> пример: 
                <b>DP_SOMETEXT</b> (макс. 16 символов, латиница без тире) 
                <br>при создании в битрикс - автоматически добавится P7_ 
                <br>передаётся в Битрикс только если "Тип параметра" = "Дополнительный"<br><br> 
                <input type="button" value="Автозаполнение" onclick="CAT_ADM_DOPPARAM_B24Autocomplete(this)">
            </label>
            <div class="ex_rel" style="height:5px;"></div>
            <input type="text" data-set="bitrix" value="" onkeyup="CAT_ADM_KeyUp(event, this, `CAT_ADM_DOPPARAM_Enter`)" style="width:100%;">
            <div class="ex_rel" style="height:15px;"></div>
            <label style="color:#777;">Тип параметра</label>
            <div class="ex_rel" style="height:5px;"></div>
            <select class="adm_dopparam_select" name="id_type" data-set="id_type" style="width:100%;" onchange="CAT_ADM_DOPPARAM_Select(this, 129)">
                <option value="1" selected="">Дополнительные</option><option value="2">Основные</option><option value="3">Общие</option>
                <option value="4">Скрытые</option>
                <option value="5">Для агрегаторов</option>
            </select>
            <div class="ex_rel" style="height:15px;"></div>
            <label style="color:#777;">Тип данных</label>
            <div class="ex_rel" style="height:5px;"></div>
            <select class="adm_dopparam_select" name="dattype" data-set="dattype" style="width:100%;" onchange="CAT_ADM_DOPPARAM_Select(this, 129)">
                <option value="1">Строковая</option>
                <option value="2">Числовая</option>
                <option value="3">Логическая</option>
                <option value="4">Дата</option>
                <option value="5">Денежный</option>
            </select><br><br>
            <input type="button" value="Enter" onclick="CAT_ADM_DOPPARAM_Enter(this)">
        </div>
    </div>
    </div>
    
            
    <br><br>
    <div style="position: relative;">
        <div class="getback" style="position: relative; padding: 10px; background:#CCC; color:#000; box-shadow: 0 0 0 1px #999;"></div>
    </div>
    <br><br><br><br>
</body>
</html>