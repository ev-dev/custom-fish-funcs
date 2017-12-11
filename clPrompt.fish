# Defined in /Users/admin/.config/fish/functions/clPrompt.fish @ line 2
function clPrompt
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
end
