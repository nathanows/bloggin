// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require jquery.dataTables.columnFilter
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  $('.post-table tfoot th').each(function() {
    var title = $('.post-table thead th').eq($(this).index()).text();
    if(title != "" && title != "Tags" && title != "Comments") {
      $(this).html('<input type="text" class="post-col-search" placeholder="Search '+title+'" />'  );
    }
  });

  var table = $('.post-table').DataTable({
    "aoColumns": [
      null,
      null,
      null,
      null,
      null,
      { "bSortable": false, "bSearchable" : false },
      { "bSortable": false, "bSearchable" : false },
      { "bSortable": false, "bSearchable" : false }
    ]
  });

  table.columns().every( function () {
    var self = this;

    $('input', this.footer()).on('keyup change', function() {
      self.search(this.value).draw();
    });

    $('.tag-select', this.footer()).on('change', function() {
      self.search(this.value).draw();
    })
  });

  $('.dataTables_paginate').addClass('right');
});
