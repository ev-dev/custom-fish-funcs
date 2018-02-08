function fish_right_prompt
  if test $CMD_DURATION
    set_color 777
    echo -n -s (echo $CMD_DURATION | humanize_duration)
    set_color normal
  end
end
