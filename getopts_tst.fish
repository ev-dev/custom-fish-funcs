# Defined in - @ line 2
function getopts_tst
	getopts $argv | while read -l key value
        switch $key
            case _
                echo "case _  ->  $value"
            case h help
                echo "case help  ->  $value"
            case b
                echo "case b  ->  $value"
            case 'fo'
                echo "case foo  ->  $value"
        end
    end
end
