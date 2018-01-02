# Defined in - @ line 2
function bwout
	clear
    proc 'fetching package information'
    inf 'listing all outdated packages'
    spin "brew outdated"
end
