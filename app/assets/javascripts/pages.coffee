# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $( ".datepicker" ).datepicker();

$( "#search_category").change ->
  selected_cat = $( "#search_category").val()
  $.getJSON "/options/categories.json?category=#{selected_cat}", (result) ->
    spec_list = $("#search_specialty")
    spec_list.empty();
    for key, value of result
      spec_list.append($("<option>#{value}</option>"))
    spec_list.focus()
