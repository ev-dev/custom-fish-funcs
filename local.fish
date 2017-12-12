<<<<<<< HEAD
# Defined in - @ line 2
function local --argument dir
	if test -z "$dir"
        cd $local
        ls
    else
        cd $local/$dir
=======
function local --argument dir
	if test -z "$dir"
        cd ~/webdev/JS/local-dev-repos
        ls
    else
        cd ~/webdev/JS/local-dev-repos/$argv
>>>>>>> master
        ls -1
    end
end
