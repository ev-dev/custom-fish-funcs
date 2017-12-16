# Defined in - @ line 1
function pyp
	set py3ver (python3 --version)
    eko -nltb $YL"- Using pip3 for $py3ver"
    /usr/local/bin/pip3 $argv
end
