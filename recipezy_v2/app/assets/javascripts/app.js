var map;

$(function(){

  $('#loginlink').click( slidedown_login_form );
  $('#cancel_login_form').click( cancel_login_form );
  $('#new_recipe_btn').click( slidedown_recipe_form );
  $('#cancel_recipe_form').click( cancel_recipe_form );
  $('#add_ingredient').click(new_ingredient_form);
  $('#select_by_ingredient').click(select_by_ingredient);
});


function select_by_ingredient()
{
  var key_ingredient = $('#Ingredient').val();

  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/recipes/" + key_ingredient + "/keyingredient"
    }).done(process_recipes);

  return false;

}

function process_recipes(found)
{
  alert(found);
  $('#recipes').empty();
  alert(found);
  _.each(recipes, alert('hello'));
}


function display_recipe(recipe)
{

}

function new_ingredient_form()
{
  alert('hello');
  $('#ingredient_form').show();
  $('#units').val('');
  $('#recipe_note').val('');
  $('#units').focus();
}


function slidedown_login_form()
{
  $('#loginform').slideToggle( 300, get_login_form )
}

function get_login_form()
{
  $('#loginform').show();
}

function slidedown_recipe_form()
{
  $('#new_recipe').slideToggle( 300, get_recipe_form )
}

function get_recipe_form()
{
  $('#new_recipe').show();
}

function cancel_login_form()
{
  $('#cancel_login_form').parent().parent();
}

function cancel_recipe_form()
{
  $('#new_recipe').hide();
  $('#recipes').show();
}

function show_recipe_form()
{
  $('#recipesform').reveal();
}


