# Defined in /Users/admin/.config/fish/functions/sptst.fish @ line 2
function sptst
	set -l results (speedtest --timeout 30)
    node /Users/admin/webdev/js-all/learn-js/misc-problems/showPrettySpeed.js $results
end
