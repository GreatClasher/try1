/****************************************************************
	Website: webpixstudio.com
	Name: fadeSlider
	Author: Subrata Dhal
	version: 1.0
	Date: 12/07/2013
******************************************************************/
var subu;
var subuUl;
var subuUlLi;
var countChildren;
var arrayLastEntry;
var b;
var newi=0;
var currCount=0;

(function($) {
     jQuery.fn.fadeslider = function() {
          
        //set duration time; 
        window.setInterval(setDuration, 4000);
        function setDuration(){
            if(currCount==0){
                currCount=1;
            }
            else{
                $(subuSliderNext);
            }
        }
        
     subu = $(this).attr('id');
     subuUl = $("#"+subu+' ul');
     subuUlLi = $("#"+subu+' ul li');
     countChildren = subuUl.children().length; //count total li
     arrayLastEntry = countChildren-1;
     b = subuUlLi.hide();

	  // push li element to array 
	  var imgArr = [];
	  $(subuUlLi).each(function(){
		  imgArr.push(this);
	  });

	  
	  function subuSliderNext(){ 
		$('.slider-title').remove();
		if(arrayLastEntry>newi)  
			{
			  $(imgArr[newi]).fadeOut(200);
			  $(bulArr[newi]).removeClass('bulletactive');
			  ++newi;
			  $(imgArr[newi]).fadeIn(2000);
			  altTextPrint();
			  $(bulArr[newi]).addClass('bulletactive');
			}
		 else{
			 $(imgArr[newi]).fadeOut(200);
			 $(bulArr[newi]).removeClass('bulletactive');
			 newi=0;
			 $(imgArr[newi]).fadeIn(2000);
			 altTextPrint();
			 $(bulArr[newi]).addClass('bulletactive');
		 }
	  };
	  function subuSlsiderPreview(){ 
		$('.slider-title').remove();
		if(newi>0)
			{
				$(bulArr[newi]).removeClass('bulletactive');
				$(imgArr[newi]).fadeOut(100);
				$(bulArr[newi-1]).addClass('bulletactive');
				$(imgArr[newi-1]).fadeIn(1000);
				altTextPrint();
				--newi;
			}
		else
			{
				newi=0;
				$(bulArr[newi]).removeClass('bulletactive');
				$(imgArr[newi]).fadeOut(100);
				newi=countChildren-1;
				$(bulArr[newi]).addClass('bulletactive');
				$(imgArr[newi]).fadeIn(1000);
				altTextPrint();

			}
	  };

	  var vParentDiv=$('<div id="sliderBulet"></div>');
	  $('#'+subu).append(vParentDiv);
	  for(newk=0; newk<countChildren; newk++)
	   { 
	  var vChildDiv=$('<div>',{'id':'b'+newk});
		  $('#sliderBulet').append(vChildDiv);
	   }

	  var bulArr = [];
	  $("#sliderBulet div").each(function(){
		  bulArr.push(this);
	  });

	  var c = subuUlLi.first().show();
	  $(bulArr[newi]).addClass('bulletactive');

	  $("#sliderBulet div").on("click", function(){
		  $('.slider-title').remove();
		  var id=$(this).attr("id");
		  id = id.replace('b','');
		  if(newi<id){
			  $(imgArr[newi]).fadeOut(100);
			  $(bulArr[newi]).removeClass('bulletactive');
			  $(bulArr[id]).addClass('bulletactive');
			  $(imgArr[id]).fadeIn(1000);
			  newi=id;
			  currCount=0;
                          altTextPrint();
		  }
		  else{
			  $(imgArr[newi]).fadeOut(100);
			  $(bulArr[newi]).removeClass('bulletactive');
			  $(bulArr[id]).addClass('bulletactive');
			  $(imgArr[id]).fadeIn(1000);
			  newi=id;
			  currCount=0;
                          altTextPrint();
		  }
	  });
	  altTextPrint();
	  function altTextPrint(){
		var setValue = $(imgArr[newi]).find('img').attr("alt");
			if(setValue!=0)
			{
			  $(imgArr[newi]).append('<div class="slider-title">');
			  $('.slider-title').html(setValue).animate({'top':430+'px'},1000)
			}
	  };
	  $('#'+subu).append('<a id="subuprev">','<a id="subunext">');
	  $("#subunext").on("click", function(e){
		  e.preventDefault();
		  subuSliderNext();
		  currCount=0;
	  });
	  $("#subuprev").on("click", function(e){
		  e.preventDefault();
		  subuSlsiderPreview();
		  currCount=0;
	  });
  };
})(jQuery);