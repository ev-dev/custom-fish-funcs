# Defined in - @ line 1
function pyp2
	set py2ver (python --version)
    eko -nltb $YL"- Using pip for $py2ver"
    /usr/local/bin/pip $argv
end
