// import $ from 'jquery';
require('jquery')

export default class Global {
    static start() {
        // alert('i work')
        $('document').ready(function(){
            $('a[data-show-modal]').click(function(e){
                e.preventDefault();
                let show_modal = $(this).data('show-modal');
                $(show_modal).toggleClass('show-modal');
            });

            // let banner_gif = $('#main-content .blur-background').data('banner');
            // console.log(banner_gif);
            // $('#main-content .blur-background').css('background-image', 'url('+ banner_gif +')');
            // $('#main-content .blur-background').removeAttr('data-banner');

            // $('.sidebar-navigation').click(function(){
            //    $('.sidebar-navigation-modal').toggleClass('show-modal')
            // });
            // resize_content()
            // setTimeout(, 300);
        });

        // $(window).resize(function(){
        //     resize_content()
        // });
    }

}
/*
function resize_content() {
    let height = $('.project-item').height();
    $('.project-item').width(height);
}*/