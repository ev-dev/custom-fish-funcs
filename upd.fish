# Defined in - @ line 2
function upd
	inf 'fetching updates from HomeBrew'
    #touch $tmp/update-all-cmd.log
    #spin "brew update" >/dev/null
    brew outdated >$tmp/update-all-cmd.log
    echo -e '\n\n\n################################\n\n\n' >$tmp/update-all-cmd.log

    inf 'fetching updates from FNM'
    fnm ls >$tmp/update-all-cmd.log
    echo -e '\n\n\n################################\n\n\n' >$tmp/update-all-cmd.log

    inf 'fetching updates from NPM'
    npm out -g --depth=0 >$tmp/update-all-cmd.log
    echo -e '\n\n\n################################\n\n\n' >$tmp/update-all-cmd.log

    inf 'fetching updates from PIP'
    #pip3 list --outdate
    #echo -e '\n\n\n################################\n\n\n' >$tmp/update-all-cmd.log

    inf 'fetching updates from GEM'
    #gem outdated
    #echo -e '\n\n\n################################\n\n\n' >$tmp/update-all-cmd.log
end
