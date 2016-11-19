$(document).ready(function(){
  $('.user_show').on('click', '.archive', function(){
    var button = $(this)
    var categoryId = $(this).closest('.small-cards').data('id')
    $.ajax({type: 'delete',
      url: button.data('url'),
      success: function(){
        button.closest('.small-cards').remove();
      }
    })
  })

  $('.user_show').on('click', '.unarchive', function(){
    var button = $(this)
    var categoryId = $(this).closest('.small-cards').data('id')
    $.ajax({type: 'delete',
      url: button.data('url'),
      success: function(){
        button.closest('.small-cards').remove();
      }
    })
  })

});
