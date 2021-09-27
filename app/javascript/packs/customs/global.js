// import $ from 'jquery';
require('jquery');
import Glide from '@glidejs/glide'

export default class Global {
    static start() {
        // alert('i work')
        $('document').ready(function(){

            $('a[data-show-modal]').click(function(e){
                e.preventDefault();
                let show_modal = $(this).data('show-modal');
                $(show_modal).toggleClass('show-modal');
            });

            resize_slider(true)

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

        $(window).resize(function(){
            resize_slider(false)
        });
    }

}
function resize_slider(init){
    if($('.glide').length > 0){
        if(init){
            new Glide('.glide').mount();
        }
        let bullet_count = $('.projects-slider .glide__slide img').length
        if(bullet_count <= 5){
            let width_image = $('.projects-slider .glide__slide img').width();
            $('.glide__bullets').width(width_image);
        } else {
            let height_image = $('.projects-slider .glide__bullet').height(),
                margin = parseInt($('.projects-slider .glide__bullet').css('margin-right')) * 2,
                new_width = bullet_count * (height_image + margin);

            $('.glide__bullet').width(height_image);
            $('.glide__bullets').width(new_width);
        }

        // let width_image = $('.projects-slider .glide__slide img').width(),
        //     width_container = $('.projects-slider .glide__slide').width(),
        //     one_margin = (width_container  - width_image) / 2,
        //     margin = parseInt($('.projects-slider .glide__bullet').css('margin-right')),
        //     new_margin = one_margin - margin;
        // console.log('resize');
        // $('.glide__bullets').css('padding-left', new_margin);
    }
}
/*
function resize_content() {
    let height = $('.project-item').height();
    $('.project-item').width(height);
}*/