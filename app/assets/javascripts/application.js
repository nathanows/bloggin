//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require jquery.dataTables.columnFilter
//= require foundation
//= require_tree .

$(document).ready(function(){
  // Integrate Foundation JS
  $(document).foundation();

  addInputFields();

  setupDataTableAndBindEvents();

  // Add class to pagination to align to right side of page.
  $('.dataTables_paginate').addClass('right');

  asyncCommentPost();
});
