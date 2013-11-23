$(document).ready(function(){
// Basic branching wizard
	$("#brancher").wizard({
	transitions: {
		color: function( $step, action ) {
			var branch = $step.find("[name=color]:checked").val();

			if (!branch) {
				alert("Please select a value to continue.");
			}

			return branch;
		}
	}
	});

});
function debug(){
	console.log("sluta läsa konsolen");		
}			
debug();