# Defined in - @ line 2
function pyp
	set py3ver (python3 --version)
    ekko "using pip3 for $py3ver"

    if [ "$argv[1]" = 'u' ]
        /usr/local/bin/pip3 install --update $argv[2..-1]
    else if [ "$argv[1]" = 'i' ]
        /usr/local/bin/pip3 install $argv[2..-1]
    else
        /usr/local/bin/pip3 $argv
    end
end
