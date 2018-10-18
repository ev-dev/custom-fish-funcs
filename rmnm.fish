# Defined in - @ line 2
function rmnm
	inf "directory:" (rwd)
    inf 'delete ALL Node.js dependency caches found here?'
    proc 'recursively removing '$I'node_modules'$N'directories'
end
