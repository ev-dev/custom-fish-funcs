# Defined in /Users/admin/.config/fish/functions/qcl.fish @ line 2
function qcl --argument repoToClone
	if begin test -z "$repoToClone"
			or [ "$repoToClone" = 'help' ]
			or [ "$repoToClone" = '-h' ]
			or [ "$repoToClone" = '--help' ]
		end

		if test -z "$repoToClone"
				set_color red
				echo -e '\n  - ERROR: Not Enough Arguments -\n\n'
		end
		
		# Custom help/man page
		clPrompt

	else if test (count $argv) -eq 1
		set currPWD (eval pwd)
		set newRepo (string split / "$repoToClone")[-1]

		git clone git@gitlab.com:quartolio-dev/$repoToClone.git
		cd $newRepo

		set_color cyan
		echo -e "\n   New Repo Setup In:"
		set_color normal
		echo -e "$currPWD \n"
		set_color cyan
		echo -e '   With Contents:'
		set_color normal
		ls -1
		echo ' '
  else
		set FLAG_OR_NEWNAME $argv[2]
        set newRepo (string split / "$repoToClone")[-1]

		getopts $FLAG_OR_NEWNAME | while read -l key options
			switch $key
				case _
					set newRepoName $FLAG_OR_NEWNAME
					set_color cyan
					echo -e "\n - New local repo will be `$newRepoName` \n"

					set_color normal
					git clone git@gitlab.com:quartolio-dev/$repoToClone.git $newRepoName
					cd $newRepoName

					set currPWD (eval pwd)

					if test (count $argv) -gt 2
						set OPTIONS_OR_FLAG $argv[3]

						getopts $OPTIONS_OR_FLAG | while read -l selected flags
							switch $selected
								case _
									echo -e 'ERROR: unknown option or default'
								case i
									if test -e package-lock.json
										set_color green
										echo -e "\n - Installing Dependencies with NPM...\n"
										set_color normal
										spin "npm install > /dev/null"
									else
										set_color green
										echo -e "\n - Installing Dependencies with Yarn...\n"
										set_color normal
										spin "yarn > /dev/null"
									end
								case o
									set_color green
									echo -e '\n - Opening Repository in VSCode...\n'
									set_color normal
									code .
								case p
									set_color green
									echo -e '\n - Viewing `package.json` in Terminal...\n'
									set_color normal
									micro './package.json'
								case '*'
									echo -e 'ERROR: unknown option or default'
									return
							end
						end
					
					else
						set_color cyan
						echo -e '\n   New Repo Setup In:'
						set_color normal
						echo -e " $currPWD"
						set_color cyan
						echo -e '\n   With Contents:'
						set_color normal
						ls -1
						echo ' '
						return
					end

				case i
					git clone git@gitlab.com:quartolio-dev/$repoToClone.git
					cd $newRepo

					if test -e package-lock.json
						set_color green
						echo -e "\n - Installing Dependencies with NPM...\n"
						set_color normal
						spin "npm install > /dev/null"
					else
						set_color green
						echo -e "\n - Installing Dependencies with Yarn...\n"
						set_color normal
						spin "yarn > /dev/null"
					end
				case o
					set_color green
					echo -e '\n - Opening Repository in VSCode...\n'
					set_color normal
					code .
				case p
					git clone git@gitlab.com:quartolio-dev/$repoToClone.git
					cd $newRepo

					set_color green
					echo -e '\n - Viewing `package.json` in Terminal...\n'
					set_color normal
					micro './package.json'
				case '*'
					set_color red
					echo -e 'ERROR: Caught Execption...Flag not recognized.\n'
					set_color normal
					return
			end
		end
	end
end
