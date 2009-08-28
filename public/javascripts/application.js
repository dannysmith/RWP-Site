// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  
  //Define Pause function.
  $.fn.pause = function(duration) {
      $(this).animate({ dummy: 1 }, duration);
      return this;
  };
  
  //Switches out the password and email fields in the sidebar so that their contents dissapears when clicked.
  
  $('#password-clear').show();
  $('#sidebar #password').hide();

  $('#sidebar #login').focus(function() {
    if($(this).val() == 'email') {
      $(this).val("");
    }
  });
  $('#sidebar #login').blur(function() {
      if($(this).val() == '') {
          $(this).val("email");
      }
  });
  
  $('#password-clear').focus(function() {
      $(this).hide();
      $('#sidebar #password').show();
      $('#sidebar #password').focus();
  });
  
  $('#sidebar #password').blur(function() {
      if($(this).val() == '') {
          $('#password-clear').show();
          $(this).hide();
      }
  });
  
  //Updates slug for pages as user types in title for page editing.

  $('#page_title').keyup(function() {
    var slugcontent = $(this).val();
    
    var slugcontent_hyphens = slugcontent.replace(/\s/g,'-');
    var finishedslug = slugcontent_hyphens.replace(/[^a-zA-Z0-9\-]/g,'');
    
    $('#page_name').val(finishedslug.toLowerCase());
  });

  //Sends new comment through AJAX.
    $("#new_comment").submit(function() {
      $.post($(this).attr("action"), $(this).serialize(), null, "script");
      return false;
    })
  
  
  //Deals with Spinner in submit_bit.
  $(".spinner img").hide();
  
  $(".spinner input").click(function() {
    $(this).val("Saving...");
    $(this).attr("disabled", "true");
    $(".spinner img").show();
   $(this).parents('form').submit();
  })
  
  //Deals with Confirming deletes and what-not
  $('.confirm form').submit(function(){
    var answer = confirm('Are you sure?');
    return answer;
  })
  
  
  $('table.tablesorter').tablesorter();
    
	$('textarea.tinymce').tinymce({
	  
	  //Width of Editor
	  width : "600",
	  
		// Location of TinyMCE script
		script_url : '/javascripts/tiny_mce/tiny_mce.js',

		// General options
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,code,|,justifyleft,justifycenter,justifyright,|,cut,copy,paste,pastetext,pasteword,|,search,replace,link,unlink,anchor,image,cleanup,|,insertdate,inserttime",
		theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,blockquote,|,forecolor,backcolor|,undo,redo,|,hr,|,sub,sup,|,charmap,iespell,media,advhr,|,fullscreen,|,insertlayer,moveforward,movebackward,absolute",
		theme_advanced_buttons3 : "tablecontrols,|,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons4 : "styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
		theme_advanced_source_editor_width : 800,
		
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
	
	$('textarea.tinymce_simple').tinymce({
		// Location of TinyMCE script
		script_url : '/javascripts/tiny_mce/tiny_mce.js',
		theme : "simple",
		content_css : "css/content.css"
	});
});
