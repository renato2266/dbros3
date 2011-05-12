// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$('#names_search input').keyup(function () {  
  $.get($('#names_search').attr('action'), $('#names_search').serialize(), null, 'script');  
  return false;  
});   

