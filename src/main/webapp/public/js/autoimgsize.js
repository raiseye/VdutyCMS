/**
 * Created by Administrator on 2017/7/14.
 */


    var w = $('body').width();
   function autoImageSize(father) {
       $('.'+ father+' img').each(function (i) {
           var img = $(this);
           var realWidth;
           var realHeight;
           realWidth = this.width;
           realHeight = this.height;
           if (realWidth >= w) {
               $(img).css("width", "90vw")
           }
           else {
               $(img).css("width", realWidth + 'px').css("height", realHeight + 'px');
           }
       });
   }