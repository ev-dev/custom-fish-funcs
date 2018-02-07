# Defined in - @ line 1
function func_help
	getopts $argv | while read -l key value
		switch $key
			case _
				echo "case _  ->  $value"
			case h help
				set FUNC_COMMAND 'custom_func_man'
				set FUNC_NAME 'Custom Function Manual'
				set FUNC_DESC 'Utility function to print help manuals for custom fish functions'
				set FUNC_USAGE 'options'
		end
	end
end
