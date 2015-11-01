$(document).ready(function() {


  $(".create-questions-form .add-choice").on("click", function(event) {
    event.preventDefault();
    var button = $(this);
    var form = button.parents('.create-questions-form');
    var questionChoiceField = form.find('.question-choice-field:last');
    questionChoiceField.clone().insertAfter(questionChoiceField);
    $('.question-choice-field:last').find("[type=text]").val("");

  });

  $(".created-survey-view").on("click", function(event) {
    event.preventDefault();
    var id = $(this).attr('id');
    $.ajax({
      method: "get",
      url: $(this).attr('href'),
    }).done(function(surveyView) {
      $("#"+id+".created-survey-view").parent().append(surveyView)
    });
  });


});
