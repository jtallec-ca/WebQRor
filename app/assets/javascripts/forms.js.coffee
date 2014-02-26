jQuery ->
	$ ->
		$("input[required='required']").parent('div').siblings('label').addClass('required')
