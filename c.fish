function c --argument dir
	if test -n "$dir"
cd $dir
ls -1
else
ls
end
end
