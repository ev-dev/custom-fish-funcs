# Defined in - @ line 2
function pyp
	set py3ver (python3 --version)
    if [ "$argv[1]" = '-u' ]
        eko -nltb $YL"- Using pip3 for $py3ver to update $argv[2..]"
        /usr/local/bin/pip3 install --update $argv[2..]
    else
        eko -nltb $YL"- Using pip3 for $py3ver to install $argv"
        /usr/local/bin/pip3 install $argv
    end
end
