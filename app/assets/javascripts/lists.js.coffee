# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Functions
saveOrder = (event, ui) ->
  orderings = $("li.task").map (index, task) ->
    {
      id: $(task).data("id"),
      position: index
    }
    [[$(task).data("id"), index]]
  .get()
  console.log orderings

# Event Triggers
$(".new_list").on "click", (e) ->
  $("body").trigger "new_list"
  e.preventDefault()

$("li.task").on "click", ".content", (e) ->
  $(this).trigger("toggle_notes")
  e.preventDefault()

$("li.task").on "click", "i.icon-pencil, button.cancel", (e) ->
  $(this).closest("li.task").trigger("task_edit")
  e.preventDefault()
  e.stopPropagation()

$("input.checkbox").on "click", (e) ->
  $(this).closest("li.task").trigger("complete")

$("form.edit_task").on "click", "button.task-save", (e) ->
  $(this).closest("form.edit_task").trigger("task_save")

$("form.edit_task input, form.edit_task textarea").bind "keydown", "esc", (e) ->
  $(this).closest("li.task").trigger("task_edit")
  $("body").trigger "new_task"



# Event Handlers
$("body").on "new_task", (e) ->
  $("#new_task input[type='text']").first().focus()

$("body").on "new_list", (e) ->
  new_list = $("#new_list")
  if !new_list.is(":visible")
    $('#new_list').toggleClass "hidden"
  $("#new_list input[type='text']").first().focus()
  e.preventDefault()

$("li.task").on "toggle_notes", (e) ->
  if ($(this).find(".notes div").text().length > 0)
    $(this).toggleClass("collapsed")

$("li.task").on "task_edit", (e) ->
  $(this).toggleClass("edit")
  input = $(this).find("input.focus")
  input.focus()
  input.val(input.val())

$("li.task").on "complete", (e) ->
  checked = $(this).find("input.checkbox").prop("checked")
  $(this).find("input.hidden_checkbox").prop("checked", checked)
  $(this).find("form.edit_task").trigger("task_save")

$("body").on "click", ".icon-remove-circle", (e) ->
  $("#"+$(this).data("rel")).addClass("hidden")
  e.preventDefault()

$("form.edit_task").on "task_save", (e) ->
  $(this).submit()

$(document).ready ->
  $("body").trigger("new_task")
  $("ul.tasklist").sortable({
    items: "li.task",
    handle: ".icon-move",
    axis: "y",
    cursor: "move",
    update: saveOrder
  })
