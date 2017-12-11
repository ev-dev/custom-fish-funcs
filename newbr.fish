function newbr --argument branchname
	if test -n "$branchname"
git checkout -b "$branchname"
else
echo 'Error. Did not provide name for new branch..'
end
end
