function git_distance
  command git rev-list --left-right --count 'HEAD...@{upstream}' ^ /dev/null | command awk '
  $1 > 0 { printf "%s+", $1}
  $2 > 0 { printf "%s-", $2}
  '
end
