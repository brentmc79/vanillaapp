# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(".new_list").on "click", (e) ->
  $("body").trigger "new_list"
  e.preventDefault()

$("body").on "new_list", (e) ->
  new_list = $("#new_list")
  if !new_list.is(":visible")
    $('#new_list').toggleClass "hidden"
  $("#new_list input").first().focus()
  e.preventDefault()

$("body").on "click", ".icon-remove-circle", (e) ->
  $("#"+$(this).data("rel")).addClass("hidden")
  e.preventDefault()
