$(document).ready(function(){
  $('.user_show').on('click', '.archive', function(){
    var button = $(this)
    var categoryId = $(this).closest('.category').data('id')
    $.ajax({type: 'delete',
      url: button.data('url'),
      success: function(){
        button.closest('.small-cards').remove();
      }
    })
  })
});
