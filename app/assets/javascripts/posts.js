// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// Add input fields to table footer for filterable columns
var addInputFields = function() {
  $('.post-table tfoot th').each(function() {
    var title = $('.post-table thead th').eq($(this).index()).text();
    if(title != "" && title != "Tags" && title != "Comments") {
      $(this).html('<input type="text" class="post-col-search" placeholder="Search '+title+'" />'  );
    }
  });
};

// Send AJAX post request for comment 
var asyncCommentPost = function() {
  $('.comment-submit-btn').on('click', function(e) {
    e.preventDefault();

    var $form = $('#new_comment'),
        url = $form.attr('action')
        author = $form.find("input[name='comment[author]']").val(),
        body = $form.find("textarea[name='comment[body]']").val();
     
    var posting = $.post(url, { comment: { author: author, body: body } });

    posting.done(function(data) {
      $('#no-comments').remove();
      var date = new Date();
      var comment = '<div class="panel comment">' +
        '<p><strong>' + author + '</strong><em> said:</em>' +
        '<span class="right">' +
          '<a href="#">Delete</a>' +
        '</span></p>' +
        '<hr><p>' + body + '</p></div>'
      $('.comments').append(comment)
    });
  })
};

// Setup dataTable and bind search/filter events
var setupDataTableAndBindEvents = function() {
  var table = $('.post-table').DataTable({
    "aoColumns": [
      null,
      null,
      null,
      null,
      { "bSearchable" : false },
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
}
