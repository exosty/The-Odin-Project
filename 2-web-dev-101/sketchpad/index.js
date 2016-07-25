
function enterNumber() {
	var number = window.prompt("Enter a number from 1 to 25:");
	return number;
};

function makeGrid(number) {
	if (number>=1 && number<=25){
		$('#grid').empty();
		$('#grid').width(50*number+'px');
		$('#grid').height(50*number+'px');
		for (var i = 0; i<number*number; i++)
		{
			$('#grid').append('<div class="cell"></div>');
		}
	}
	else
	{
		alert("No, that doesn't work.");
	}
};

function clearGrid() {
	$('.cell').css("background-color", "#282841");
	$('.cell').css("opacity", 1);
};

var status = "default";

function makeRandom() {
	if(status==="random")
	{
		status="default";
		$("#btn2, #btn3, #btn4").css("background-color", "#D5D5D5");

	}
	else
	{
		status="random";
		$("#btn2").css("background-color", "#585A8D");
		$("#btn3, #btn4").css("background-color", "#D5D5D5");
	}
}

function makeTrail() {
	if(status==="trail")
	{
		status="default";
		$("#btn2, #btn3, #btn4").css("background-color", "#D5D5D5");
	}
	else
	{
		status="trail";
		$("#btn3").css("background-color", "#585A8D");
		$("#btn2, #btn4").css("background-color", "#D5D5D5");
	}
}

function makeTransparent() {
	if(status==="transparent")
	{
		status="default";
		$("#btn2, #btn3, #btn4").css("background-color", "#D5D5D5");

	}
	else
	{
		status="transparent";
		$("#btn4").css("background-color", "#585A8D");
		$("#btn3, #btn2").css("background-color", "#D5D5D5");
	}
}


function paintCell(cell) {
	switch (status){
		case "default":
		$(cell).css("background-color", "white");
		break;
		case "random":
		var randomColor = "#"+Math.floor(Math.random()*16777215).toString(16);
		$(cell).css("background-color", randomColor);
		break;
		case "trail":
		$(cell).fadeTo(100,0);
		$(cell).mouseleave(function(){
			$(cell).fadeTo(1000, 1);
		});
		break;
		case "transparent":
		var currentOpacity = $(cell).css('opacity');
		if (currentOpacity>0){
			$(cell).css("opacity", currentOpacity - 0.1)
		};
		break;
	}
}

$(document).ready(function(){

    $("#btn1, #btn2 , #btn3, #btn4, #btn5, #btn6").hover(function(){
        $(this).fadeTo(0, 0.65);
        }, function(){
        $(this).fadeTo(0, 1);
    });

    $("#btn1").click(function(){
        makeGrid(enterNumber());
    });

    $("#btn2").click(function(){
    	clearGrid();
    	makeRandom();
    });
    
    $("#btn3").click(function(){
    	clearGrid();
    	makeTrail();
    });

    $("#btn4").click(function(){
    	clearGrid();
    	makeTransparent();
    });
 
    $("#btn5").click(function(){
    	clearGrid()    
    });

    $('body').on("mouseenter", ".cell", function(mouseenter){
    	paintCell($(this));
    });
});