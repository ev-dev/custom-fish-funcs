# Defined in - @ line 2
function ltst
	set latest (ls -s modified -1 -r $tests | head -1)
    proc 'entering' $PR$B$I"$latest"
    cd "$tests/$latest"
    l
end
