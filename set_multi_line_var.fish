# Defined in - @ line 2
function set_multi_line_var
	set multi_line_str '
/usr/local/bin
/Users/admin/temp
'

    set multi_line_var (echo $multi_line_str)
    set multi_line_space_str '
  /Users/admin/temp
  /Users/admin/.config/fish/functions
  /usr/local/bin
'

    set multi_line_var_alt (string split '  ' -- $multi_line_str)[2..-1]
    #echo "no spaces below"
    #echo $multi_line_var

    echo "with spaces below"
    echo $multi_line_var_alt

    for filepath in $multi_line_var_alt
        echo $filepath
    end
end
