<<<<<<< HEAD
# Defined in - @ line 1
function ...
	cd ../../
=======
function ... --argument dir
	if test -n "$dir"
cd ../../$dir
else
cd ../../
end
>>>>>>> master
end
