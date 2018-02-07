# Defined in - @ line 2
function pgstart
	# INCLUDE KILL SCRIPT FOR POSTMASTER STARTUP
    # kill #PID
    pg_ctl start -D /usr/local/pgsql/data -l /usr/local/pgsql/logfile
end
