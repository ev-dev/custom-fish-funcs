function fish_right_prompt
	set RD_B (set_color --bold red)
	set YW_B (set_color --bold yellow)
	set CY_B (set_color --bold cyan)
	set MG_B (set_color --bold magenta)	
	set GR_B (set_color --bold green)
	set GR (set_color green)
	set N (set_color normal)

  set -g __fish_git_prompt_show_informative_status 'yes'
	set -g __fish_git_prompt_showcolorhints 'yes'
	
	set -g __fish_git_prompt_char_dirtystate "$RD_B±$color_reset"
	set -g __fish_git_prompt_char_cleanstate "$GR$color_reset"
	set -g __fish_git_prompt_char_stagedstate "$YW_B●$color_reset"
	set -g __fish_git_prompt_char_stagedstate "$CY_B…$color_reset"
	set -g __fish_git_prompt_char_stateseparator ' '
	
	set -g __fish_git_prompt_color_branch "--bold" "--bold" "yellow"

	set git (__fish_git_prompt "$color_bold_magenta> $color_reset%s")

  echo -ns $git

end