# Defined in /Users/admin/.iterm2_shell_integration.fish @ line 58
function fish_prompt --description 'Write out the prompt; do not replace this. Instead, change fish_prompt before sourcing .iterm2_shell_integration.fish, or modify iterm2_fish_prompt instead.'
	# Remove the trailing newline from the original prompt. This is done
     # using the string builtin from fish, but to make sure any escape codes
     # are correctly interpreted, use %b for printf.
     printf "%b" (string join "\n" (iterm2_fish_prompt))

     iterm2_prompt_end
end
