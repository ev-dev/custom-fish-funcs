# Defined in /Users/admin/.config/fish/functions/clone.fish @ line 2
function clone --argument repoToClone
	if begin test -z "$repoToClone"
			or [ "$repoToClone" = 'help' ]
			or [ "$repoToClone" = '-h' ]
			or [ "$repoToClone" = '--help' ]
		end

		if test -z "$repoToClone"
				set_color red
				echo -e '\n  - ERROR: Not Enough Arguments -\n\n'
		end
		
		echo -e '\n ___________________________________________________________________\n'
		echo -e '                          \e[4m\e[37mCustom Command\e[39m\e[0m'
		echo -e '\n                          \e[32mcl\e[96mone and setup\e[39m\e[0m\n'

		set_color blue
		echo -e '  \e[4mUsage:\e[0m\n'
		set_color normal
		echo -e '     `\e[32mcl\e[96m` [source-repository] [options]\n\n'
		
		set_color cyan
		echo -e '  \e[4mInformation:\e[0m\n'
		set_color normal
		echo -e '     The `cl` command creates a new local repository'
		echo -e '     in your current working directory... So you should'
		echo -e '     enter the directory that you wish to place the '
		echo -e '     cloned repository before running.\n'
		
		echo -e '\e[90m  \e[1m   ________________________________________________________ \e[0m\n'
		
		set_color white -o
		echo -e '     Required shorthand for `source-repository` argument*\n'
		set_color normal
		echo -e '     The original repository with format:'
		set_color red
		echo -e '          https://github.com/repo-owner/repo-name.git'
		set_color normal
		echo -e '\n     Must be written as:'
		set_color green
		echo -e '          repo-owner/repo-name\n'
		
		set_color blue
		echo -e '  \e[4mOptions:\e[0m\n'

		set_color normal
		echo -e '     -i:  Installs dependencies with NPM or Yarn based on lockfile'     
		echo -e '     -o:  Opens new repository in VSCode'
		echo -e '     -p:  Opens `package.json` immediately in terminal\n'
		echo -e '  Select any number of options in one flag\n\n'

		set_color blue
		echo -e '  \e[4mExample:\e[0m\n'

		set_color normal
		echo -e '     \e[33m$\e[39m \e[32mcl\e[39m SomeGithub/SomeRepo myrepo -iop\n'
		set_color red
		echo -e '     \e[39m==>\e[31m Remote Repo Cloned Locally,'
		set_color magenta
		echo -e '         Install Node Modules,'
		set_color red
		echo -e '         Open Project in IDE,'
		set_color magenta
		echo -e '         Inspect "package.json"...\n'
		set_color normal
		echo -e ' ___________________________________________________________________\n\n'
		return

	else if test (count $argv) -eq 1
		set currPWD (eval pwd)
		set newRepo (string split / "$repoToClone")[-1]

		git clone https://github.com/$repoToClone.git
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
					git clone https://github.com/$repoToClone.git $newRepoName
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
										npm install > /dev/null
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
					git clone https://github.com/$repoToClone.git
					cd $newRepo

					if test -e package-lock.json
						set_color green
						echo -e "\n - Installing Dependencies with NPM...\n"
						set_color normal
						npm install > /dev/null
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
					git clone https://github.com/$repoToClone.git
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
