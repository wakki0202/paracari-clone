$("#news-modal").html("<%= escape_javascript(render 'form') %>")
$("#news-modal").modal("show")