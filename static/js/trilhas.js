// --- UPLOAD FILE 
$(".input-file").fileinput({
	'overwriteInitial': true,
	'showUpload':true, 
	'previewFileType':'any', 
	'allowedFileExtensions': ["jpg", "png", "gif"],
	'browseIcon': '<i class="glyphicon glyphicon-folder-open"></i>',
    'removeIcon': '<i class="glyphicon glyphicon-remove"></i>'
 });
      // initialize custom upload
$(".upload").fileinput({
	'overwriteInitial': true,
	'showUpload':true, 
	'previewFileType':'any', 
	'allowedFileExtensions': ["jpg", "png", "gif"],
	'browseIcon': '<i class="glyphicon glyphicon-folder-open"></i>',
    'removeIcon': '<i class="glyphicon glyphicon-remove"></i>'
});

$(".engloba-upload").find("span").last().each(function() {
    ($(this).replaceWith( "<br>Essa é sua imagem atual. Para substituir, faça o carregamento no campo acima." ))
});


// --- MENU RESPONSIVO 

function menu() {
          $('.sidebar-toggle').click(function() {
            if($(".sidebar").hasClass("sidebar-fechado")) {
              $('.sidebar').animate({
                left: "0px",
              }, 100, function() {
                $(".sidebar").removeClass("sidebar-fechado");
              });
            }
            else {
              $('.sidebar').animate({
                left: "-220px",
              }, 100, function() {
                $(".sidebar").addClass("sidebar-fechado");
              });
            }
          });
        }

  //Menu Sidebar
  $(window).resize(function() {
    var tamanhoJanela = $(window).width();
    $(".sidebar-toggle").remove();
    
    if (tamanhoJanela < 800) { 
      $('.sidebar').css('left', '-220px').addClass('side-fechado');
      $('.sidebar').append( "<div class='sidebar-toggle'><span class='glyphicon glyphicon-align-justify' aria-hidden='true'></span></div>" );
    } else {
      $('.sidebar').css('left', '0px').addClass('sidebar-fechado');
    }
    
    menu();
  });
  
  $(document).ready(function() {
    var tamanhoJanela = $(window).width();
    $(".sidebar-toggle").remove();
    
    if (tamanhoJanela < 800) { 
      $('.sidebar').css('left', '-220px').addClass('sidebar-fechado');
      $('.sidebar').append( "<div class='sidebar-toggle'><span class='glyphicon glyphicon-align-justify' aria-hidden='true'></span></div>" );
    } else {
      $('.sidebar').css('left', '0px').addClass('sidebar-fechado');
    }
    
    menu();
  });


  