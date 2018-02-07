# Defined in - @ line 2
function ficonfig
	if test -z "$argv"
        m $conf/fish/config.fish
    else
        getopts $argv | while read -l key value
            switch $key
                case c colors
                    m $conf/fish/functions/init_color_aliases.fish
                case d dirs
                    m $conf/fish/functions/init_dir_aliases.fish
                case '*'
                    m $conf/fish/config.fish
            end
        end
    end
end
