$(document).ready(function() {


  $(".create-questions-form .add-choice").on("click", function(event) {
    event.preventDefault();
    var button = $(this);
    var form = button.parents('.create-questions-form');
    var questionChoiceField = form.find('.question-choice-field:last');
    questionChoiceField.clone().insertAfter(questionChoiceField);
    // $(".create-choice").after('<div class="create-choice"></div>');
    // $(".create-choice").last().attr("method", "post").attr("action","/create_survey/1/create-questions").append('<label class="choice-input" for "choice">Choice:</label>').append('<input class="choice-input" type="text" name="question[choice][]" placeholder="Enter Choice Here"></input>')
  });

});
