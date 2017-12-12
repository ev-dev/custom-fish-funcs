<<<<<<< HEAD
# Defined in - @ line 2
function learn --argument dir
	if test -n "$dir"
        cd $learn/$dir
        ls -1
    else
        cd $learn
=======
function learn --argument directory
    if test -n "$directory"
        cd ~/webdev/JS/learn-js/$directory
        ls
    else
        cd ~/webdev/JS/learn-js
>>>>>>> master
        ls
    end
end
