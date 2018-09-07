function fish_prompt
  set -l pwd (set_color 69D2E7)(prompt_pwd)(set_color normal)
  set -g __fish_prompt_char "❯"
  set -l ve ""
  set -l git_output
  
  if type -q git
    set detached (set_color black -b FF0000)
    
    if set branch_name (git_branch_name)
      set -l gitporcelain (git_porcelain)
      set -l git_distance (git_distance)
      set -l repo_status
      set -l branch_color ""
      
      if test ! -z "$git_distance"
        set git_distance "($git_distance)"
      end

      if git_is_dirty
        #set branch_color (set_color black -b FF6524) #orange
        set branch_color (set_color black -b FF6524 -o) #orange, bold text
      else
        #set branch_color (set_color black -b 50AF08) #green
        set branch_color (set_color black -b 50AF08 -o) #green, bold text
      end

      if git_is_staged
        if git_is_dirty
          set git_status "± "
        else
          set git_status "+ "
        end
      end

      if git_is_empty
        set repo_status "●"
      end
      
      if git_is_stashed
        set repo_status ".."
      end

      set git_output "$branch_color $branch_name$repo_status$git_distance $N $gitporcelain"
    end
  end
  
  if set -q VIRTUAL_ENV
    set ve (printf "(%s)" (basename $VIRTUAL_ENV))
  end

#  if set -q NODE_VERSION
#    set ne (printf "(%s)" (basename $NODE_VERSION))
#  end
  
  echo -nes "\n$ve $pwd $N$git_output\n$__fish_prompt_char "
  # echo -nes "\n$ve $I$pwd $N$git_output\n$__fish_prompt_char "
end