# Defined in - @ line 2
function pyp2
	eko -nlb $YL' - Using pip for python version...'
    /usr/bin/python --version
    eko -nlb ' '
    if [ "$argv[1]" = '-u' ]
        #eko -nltb $YL"- Using pip for $py2ver to update $argv[2..]
        /usr/local/bin/pip install --update $argv[2..]
    else
        #eko -nltb $YL"- Using pip for $py2ver to install $argv"
        #echo -ens $YL"\n\t- Using pip for " (eval /usr/bin/python --version)
        /usr/local/bin/pip install $argv
    end
end
