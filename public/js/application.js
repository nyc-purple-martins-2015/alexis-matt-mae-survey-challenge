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
    if ($("#"+id+".created-survey-view").find("#"+id+".created-survey-container").length === 1) {
        $("#"+id+".created-survey-container").slideToggle()
    } else {
        $("#"+id+".created-survey-view").append(surveyView)
      };
    });
});

  $(".finished-survey-view").on("click", function(event) {
    event.preventDefault();
    var id = $(this).attr('id');
    $.ajax({
        method: "get",
        url: $(this).attr('href'),
    }).done(function(viewFinished) {
        console.log("testing");
        if($('#'+id+".finished-survey-view").find("#"+id+".taken-survey-container").length === 1) {
           $("#"+id+".taken-survey-container").slideToggle()
        } else {
           $("#"+id+".finished-survey-view").append(viewFinished)
        };
      });
    });

});
