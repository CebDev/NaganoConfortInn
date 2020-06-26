# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#add-adult').click ->
    val = parseInt($('#number-of-adult').val())
    if val < 5
      val += 1
    $('#number-of-adult').val(val)
    return

  $('#rm-adult').click ->
    val = parseInt($('#number-of-adult').val())
    if val > 1
      val -= 1
    $('#number-of-adult').val(val)
    return

  $('#add-child').click ->
    val = parseInt($('#number-of-child').val())
    if val < 4
      val += 1
    $('#number-of-child').val(val)
    return

  $('#rm-child').click ->
    val = parseInt($('#number-of-child').val())
    if val > 0
      val -= 1
    $('#number-of-child').val(val)
    return

