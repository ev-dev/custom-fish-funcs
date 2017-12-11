function fish_right_prompt
	set RD_B (set_color --bold red)
	set BL_B (set_color --bold blue)
	set YW_B (set_color --bold yellow)
	set YW (set_color yellow)
	set CY_B (set_color --bold cyan)
	set MG_B (set_color --bold magenta)	
	set GR_B (set_color --bold green)
	set GR (set_color green)
	set N (set_color normal)
	set B (set_color --bold white)

  set -g __fish_git_prompt_show_informative_status 'yes'
	set -g __fish_git_prompt_showcolorhints 'yes'
	
#	set -g __fish_git_prompt_char_dirtystate "$YW_B±$N $RD_B"
	set -g __fish_git_prompt_char_dirtystate "$B$N $YW±$YW_B"
#	set -g __fish_git_prompt_char_dirtystate "$RD_B       ±$color_reset"
#	set -g __fish_git_prompt_char_cleanstate "$GR_B$N "
	set -g __fish_git_prompt_char_cleanstate "$GR_B$N"
	set -g __fish_git_prompt_char_stagedstate "$YW_B●$N"
	set -g __fish_git_prompt_char_stagedstate "$CY_B…$N"
	set -g __fish_git_prompt_char_stateseparator ' '
	
	set -g __fish_git_prompt_color_branch "magenta"

	set git (__fish_git_prompt "%s ")
#	set git (__fish_git_prompt "$N             $color_reset%s")

  echo -ns $git

end