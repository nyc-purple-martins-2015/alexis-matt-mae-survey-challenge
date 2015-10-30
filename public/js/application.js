$(document).ready(function() {


  $(".create-questions-form .add-choice").on("click", function(event) {
    event.preventDefault();
    var button = $(this);
    var form = button.parents('.create-questions-form');
    var questionChoiceField = form.find('.question-choice-field:last');
    questionChoiceField.clone().insertAfter(questionChoiceField);
    $('.question-choice-field:last').find("[type=text]").val("");

  });

});
