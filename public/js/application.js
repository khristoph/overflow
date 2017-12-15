$(document).ready(function() {

	$("#answer_form").on("submit", function(event) {
		event.preventDefault();
		var answer_form = $(this);

		$.ajax({
			url: answer_form.attr('action'),
			type: answer_form.attr('method'),
			data: { answer_text: answer_form.find('#answer_text').val() },
		}).done(function(response){
			$("#answer-holster").append(response);
		})
		this.reset();
	});


	$("#comment_form").on("submit", function (event) {
		event.preventDefault();
		var newComment = $(this)

		$.ajax({
			url: newComment.attr('action'),
			type: newComment.attr('method'),
			data: {comment_text: newComment.find('#comment_text').val() },
		}).done(function(response){
			$(".question-comment-container").append(response);
		})
			this.reset();
		});

	$(".comment_form_answer").on("submit","#comment_form", function (event) {
		event.preventDefault();
		var newComment = $(this)
		var closest = newComment.closest(".answer-comment-container")
		$.ajax({
			url: newComment.attr('action'),
			type: newComment.attr('method'),
			data: {comment_text: newComment.find('#comment_text').val() },
		}).done(function(response){
			closest.find('.answer-comments-container-2').append(response);
		})
			this.reset();
		});

	$(".vote-button").on("click", function(event) {
		event.preventDefault();
		console.log("HEYEYEY");
		var button = $(this)

		$.ajax({
			url: button.parent("form").attr('action'),
			type: "post"
		})
		.done(function(response) {
			console.log(response);
			button.closest(".data_button_target").replaceWith(response);
		})
	})


	$(".best-answer-form").on("click", function(event) {
		event.preventDefault();
		console.log("clicked best answer")
		var besty = $(this)
		$.ajax({
			url: besty.attr('action'),
			type: "post",
			dataType: 'json'
		}).done(function(response){
			$('.best-answer-text').css('color','black')
			$('#answer-id-'+response.best_answer_id).css('color','green')
		})
	})

});
