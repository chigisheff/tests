$(document).ready(function() {
    var user = 1; // для теста пользователь один
    var timer,startTime;
    var time = startTime = 3; // секунды на раздумие - открытие поста
    var readablePost, postHeight, previousScrollPosition=0, previosPost=0;
    $('#content button').click(function(){
        
        getContent(user);
        $('.getback').text('Пользователь - '+ user);
    });
    
    $('.item').on('mouseover','.div',function(){
        $(this).css('cursor','text');
        readablePost = $(this).attr("id");
        postHeight = $(this).outerHeight(true);
        console.log(readablePost,postHeight);
            timer = setInterval(function() {
            if(time > 0){
                time--;
            } else {
                $('#'+readablePost+' .post').css("min-height","100px");
                clearInterval(timer);               
                return false;
            }
        }, 1000);
    }).on('mouseleave','.div',function(){
        previosPost = readablePost; // Запоминаем покинутый пост. Один из вариантов отслеживания прочитаного поста
        time = startTime;   
        clearInterval(timer);
        return false;
    });
    
    $(".item").scroll(function() { //Где то "троит" завершение чтения поста, подумать...
        let scrollPosition = $(this).scrollTop();
        if (scrollPosition > previousScrollPosition) {
            if(previousScrollPosition > 0.8*postHeight){ // Вариант отслеживания прочитывания поста                
                if(readablePost !== previosPost){
                    //previousScrollPosition = previousScrollPosition+postHeight;
                    let sign = readablePost.replace(/\D/g, "");
                    putRead(user,sign);
                    afterReadMark(sign);
                    previousScrollPosition = 0;
                    getContent(user,0);
                }
                return false;
            }            
        } 
        previousScrollPosition = scrollPosition;
    });
    
    function getContent(usercode,sort=0 ){
        const array = {'user':usercode,'sortby':sort};
        $.ajax(
            {
                type: "POST",
                data:{   
                    action: 'getContent',    
                    array},
                url:'/api.php',
                dataType: "json",
                success: function(data){
                    $('.item').text('');
                    writeContent(data);
                }
            });
    }
    
    function putRead(user, post){
        array = {'usern':user,'postn':post};
        $.ajax(
            {
                type: "POST",
                data:{   
                    action: 'putReadComplite',    
                    array},
                url:'/api.php',
                dataType: "json",
                success: function(data){
                    if(data){
                        $('.item').text('');
                        writeContent(getContent(user,0));
                    }
                }
            });
    }
    setTimeout(afterReadMark, 2000); 
    //setTimeout(getContent,2000);
    function afterReadMark(post){
        $.ajax(
            {
                type: "POST",
                data:{   
                    action: 'putReadComplite',    
                    post},
                url:'/api.php',
                dataType: "json",
                success: function(data){
                    if(data){
                        $('.item').text('');
                        writeContent(getContent(user,0));
                    }
                }
            });
    }
    
    function writeContent(arrayD){
        array = arrayD['data'];
        for(var i=0; i < 15; i++){
            var says = array[i];
            var mark = "post"+says['id_post'];
            var comphead = "sub"+mark;
            $('#content .grid .item').append('<hr>');
            $('#content .grid .item').append('<div class="div" id="'+mark+'"></div>');
            $("#"+mark).append('<div class ="header" id="'+comphead+'"></div>');
            $("#"+mark).append('<div class ="post"></div>');
            $("#"+comphead).append('<div class="h_number"></div>');
            $("#"+comphead).append('<div class="h_content"></div>');
            $('#'+comphead+' .h_number').text(says['id_post']);
            $('#'+comphead+' .h_content').html(says['title']+'<br><br> Опубликован '+says['created_at']+ ' Просмотров '+' '+says['viewed']);
            $('#'+mark+' .post').text(says['content']);
        }
        array.length = 0;
    }
});
