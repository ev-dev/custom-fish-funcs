function fish_prompt
	set -l realhome ~
	set -l git_output
	set directory (set_color green)(echo $PWD | sed -e "s|^$realhome|~|")(set_color normal)

	set_color $fish_color_cwd
	echo -s $directory ' ' (git-radar --fish --fetch)
	set_color normal
	
	if [ $USER = "root" ]
		set caret (set_color red ) "#"
	else
		set caret (set_color magenta) " "
	end

	echo -s $caret ' '(set_color normal)
end
