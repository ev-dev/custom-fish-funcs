# Defined in /Users/admin/.config/fish/functions/custom_func_man.fish @ line 3
function custom_func_man --argument FUNC_COMMAND FUNC_NAME FUNC_DESC FUNC_USAGE FUNC_EXAMPLE FUNC_OPTIONS

	# Help prompt for this function
	if begin
			[ "$FUNC_COMMAND" = '-h' ]
			or [ "$FUNC_COMMAND" = '--help' ]
		end

		set FUNC_COMMAND 'custom_func_man'
		set FUNC_NAME 'Custom Function Manual'
		set FUNC_DESC 'Utility function to print help manuals for custom fish functions'
		set FUNC_USAGE 'options'
		set FUNC_OPTIONS [['-h', '--help'], ['']]

	end

	# Actual help prompt stdout
	eko -nlt $YL"\t$FUNC_NAME" $N$D'(Custom Command)'
	
	eko -nlat "$FUNC_DESC"
	
	eko -tb $U$BL'Usage'$N':'
	eko -nlat $B$GR"$FUNC_COMMAND" $N'['$BL'options'$N'] or ['$BL'existing project'$N']'
	
	eko -nlat $U$BL'Options'$N':'
	eko -t $GR'-t'$N',' $GR'--type' $N'['$BL'type'$N'] ['$BL'new project name'$N']'
	echo -e '\t   '"$dim"'Generates new project from customized\n\t   boilerplates and begins tracking with git\n'

	eko -t $GR'-cl'$N',' $GR'--clone' $N'['$BL'clone options'$N']'
	echo -e '\t   '"$dim"'Generates new project from remote repository\n'
	
	
	# eko -nlt $YL'\tMakeTest' $N$D'(Custom Command)'
	# eko -nlat 'Project generator for testing things quickly\n\t with no other setup required.'
	
	# eko -nlat $U$BL'Usage'$N':' $B$GR'mktest' $N'['$BL'options'$N'] or ['$BL'existing project'$N']'
	
	# eko -nlat $U$BL'Options'$N':'
	# eko -t $GR'-t'$N',' $GR'--type' $N'['$BL'type'$N'] ['$BL'new project name'$N']'
	# echo -e '\t   '"$dim"'Generates new project from customized\n\t   boilerplates and begins tracking with git\n'

	# eko -t $GR'-cl'$N',' $GR'--clone' $N'['$BL'clone options'$N']'
	# echo -e '\t   '"$dim"'Generates new project from remote repository\n'
									
	# eko -nlat $U$BL'Boilerplate Types'$N':' $D'(defaults to empty)'
	# echo -e '\t '"$green"'empty'"$dim"' - Scaffolds basic blank project'
	# echo -e '\t '"$green"'static'"$dim"' - Basic static HTML, CSS, JS project'
	# echo -e '\t '"$green"'node'"$dim"' - Blank nodejs setup'
	# echo -e '\t '"$green"'exp'"$dim"' - Basic express server'
	# echo -e '\t '"$green"'exp-seq'"$dim"' - Express server with postgresSQL'
	# echo -e '\t '"$green"'react'"$dim"' - Simple react setup'
	# echo -e '\t '"$green"'redux'"$dim"' - React with redux setup'
	# echo -e '\t '"$green"'full'"$dim"' - Express, sequelize, react, react-redux'
	# echo -e '\t   '"$green"'-o'"$dim"' - More options for full template'
	# echo -e '\t   '"$green"'graphql'"$dim"' - Create with a GraphQL API\n'
	# set_color normal
end
