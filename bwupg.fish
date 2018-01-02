# Defined in - @ line 2
function bwupg
	if test -z "$argv"
        proc 'fetching package information'
        inf 'listing outdated packages'
        spin "brew outdated"
        proc 'upgrading all outdated packages'
        brew upgrade
        suc 'all packages are latest'
    else
        for package in $argv
            proc "upgrading $package"
            spin "brew upgrade $package"
            inf "finished upgrading $package"
        end
        suc 'all specified packages are lastest'
    end
end
