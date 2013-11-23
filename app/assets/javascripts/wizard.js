$(document).ready(function(){
// Basic branching wizard
	$("#brancher").wizard({
	transitions: {
		wiz: function( $step, action ) {
			var branch = $step.find("[name=wiz]:checked").val();

			if (!branch) {
				alert("Please select a value to continue.");
			}

			return branch;
		},
		com20: function( $step, action ) {
			var branch = $step.find("[name=com20]:checked").val();

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
