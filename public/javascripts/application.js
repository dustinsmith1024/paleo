// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $("#add-another").click(function(){

    $clone = $("p.ingredient").last().clone();
    $clone.appendTo("#ingredients");

    $new_div = $("p.ingredient").last();
    id = $new_div.attr("id");
    num = parseInt(id.split("-")[1]) + 1;
    $new_div.attr("id","ingredient-" + num);
    $new_div.children().each(function(){

    if($(this).is("input")){
      name = $(this).attr("name");
      id = $(this).attr("id");
      one = name.split("][")[0];
      two = parseInt(name.split("][")[1]) + 1;
      three = name.split("][")[2];
      new_name = one + "][" + two + "]["+three;
      $(this).attr("name",new_name);
      num = parseInt(id.split("_")[3]) + 1;
      $(this).attr("id","recipe_ingredients_attributes_" + num + "_amount");
      $(this).val('');
   }

   if($(this).is("label")){
     name = $(this).attr("for");
     num = parseInt(name.split("_")[3]) + 1;
     $(this).attr("for","recipe_ingredients_attributes_" + num + "_amount");
   }

});


  });

  $("#search").bind('focus', function(){
	$("#welcome-message").hide('slow');
  });

  $("#search").bind('keyup keypress', function(){
	$(this).parents("form").submit();
  });

});
