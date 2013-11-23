# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(function($) {
				// Example 1: Basic wizard with validation
				$("#example-1").wizard({
					stepsWrapper: "#wrapped",
					submit: ".submit",
					beforeSelect: function( event, state ) {
						var inputs = $(this).wizard('state').step.find(':input');
						return !inputs.length || !!inputs.valid();
					}
				}).wizard('form').submit(function( event ) {
					event.preventDefault();
					alert('Form submitted!');

				}).validate({
					errorPlacement: function(error, element) { 
						if ( element.is(':radio') || element.is(':checkbox') ) {
							error.insertBefore( element.next() );

						} else { 
							error.insertAfter( element );
						}
					}
				});

				// Example 2: Basic wizard with progress bar
				$("#progressbar").progressbar();

				$("#example-2").wizard({
					afterSelect: function( event, state ) {
						$("#progressbar").progressbar("value", state.percentComplete);
						$("#location").text("(" + state.stepsComplete + "/" + state.stepsPossible + ")");
					}
				});

				// Example 3: Basic branching wizard
				$("#example-3").wizard({
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

				// Example 4: Nested Branches
				$("#example-4").wizard();
			});