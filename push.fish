# Defined in - @ line 2
function push
	set tempBranch (git branch 2>/dev/null | grep '^*' | colrm 1 2 | string sub -s 7)
    set tempLen (string length $tempBranch)
    set strLen (math $tempLen - 3)
    set branchName (string sub -s 1 -l $strLen "$tempBranch")
    #echo "git push origin $branchName"
    git push origin "$branchName"
end
