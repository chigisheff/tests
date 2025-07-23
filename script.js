        // Функция фильтрации
    function CAT_ADM_SK_Find(eto, term) {
        console.log('буБу, term: ' + term);
        var text = (term || '').toLowerCase();
        var select = $(eto);
        var options = select.find('option');

        if (options.length) {
            options.each(function() {
                var optionText = $(this).text().toLowerCase();
                // Показываем опцию, если текст совпадает или это отключённая опция
                $(this).prop('hidden', !(optionText.includes(text) || $(this).is(':disabled')));
            });
        }
        // Обновляем Select2
        $(eto).trigger('change.select2');
    }

    // Функция сохранения выбора
    function save_org_sel() {
        console.log('бу');
        /* Раскомментируйте для отправки на сервер
        EXPORT_MODAL();
        let id_org = $("#sel_org").val();
        $.post(H_ARR['hos'] + '/catalog/adm/zk/get.php', { save_org: 1, zk: H_ARR['GET']['zk'], id_org: id_org }, function (json) {
            EXPORT_MODAL({ fade: 200 });
        }, 'json');
        */
    }

    $(document).ready(function() {
        // Инициализация Select2
        $('#sel_org').select2({
            placeholder: "Поиск организации",
            minimumResultsForSearch: 0 // Всегда показывать поле поиска 
        });
        
        $('#sel_org').on('select2:open', function(e) {
        // Событие срабатывает при открытии выпадающего списка
        console.log('Select2 открыт');

        // Добавление обработчика события для ввода текста
            $('.select2-search__field').on('input', function() {
              const searchTerm = $(this).val();
              console.log('Ввод текста:', searchTerm);
              // Здесь можно добавить логику обработки введенного текста
            });
        });

        $('#sel_org').on('select2:select', function (e) {
            // Событие срабатывает при выборе элемента
            const selectedItem = e.params.data;
            console.log('Выбран элемент:', selectedItem);
            save_org_sel();
            // Здесь можно добавить логику обработки выбранного элемента
        });
        
});