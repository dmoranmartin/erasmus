
var breakfunction = function(word, letter){
	if (word[0].charAt(0).toLowerCase() == letter){
		var content_div = $("#alph").val()
		$("#alph").html( <a href = "/words/:id/definitions"> word  </a> + ' ' + content_div);
	}
}
var findLetter = function(letter)  {
	var letter = letter;
	for (var i = 0; i < gon.words.length; i++){
			breakfunction(gon.words[i], letter);
		}

		
};
$(".letter").on('click', function(event){
	findLetter(event.currentTarget.innerText);	
});