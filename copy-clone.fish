# Defined in /Users/admin/.config/fish/functions/cl.fish @ line 2
function cl --argument repoToClone REST
	if begin test -z "$repoToClone"
            or test "$repoToClone" = 'help'
        end
        if test -z "$repoToClone"
            set_color red
            echo -e '\n  - ERROR: Not Enough Arguments -\n\n'
        else if test "$repoToClone" = 'help'
            echo -e '\n ___________________________________________________________________\n'
            echo -e '                          \e[4m\e[37mCustom Command\e[39m\e[0m'
            echo -e '\n                          \e[32mcl\e[96mone and setup\e[39m\e[0m\n'

            set_color normal
            echo -e '\e[90m                  \e[1m* Run command in a directory *\e[0m'
            echo -e '\e[90m                  \e[1m* where the repo should live *\e[39m\e[0m\n'
        end

        set_color blue
        echo -e '  \e[4mUsage:\e[0m\n'
        set_color normal
        echo -e '  `cl` [repository to clone] [options]\n\n'
        
        set_color cyan
        echo -e '  \e[4mInfo:\e[0m'
        set_color normal
        echo -e '  Valid shorthand required for [repository to clone] argument.'
        set_color red
        echo -e '  https://github.com/repo-owner/repo-name.git'
        set_color normal
        echo -e '  Must be written as...'
        set_color green
        echo -e '  repo-owner/repo-name\n'
        
        set_color blue
        echo -e '  \e[4mOptions:\e[0m\n'

        set_color normal
        echo -e '     -r:  Run any command(s) after cloning'        
        echo -e '     -i:  Install modules with NPM'
        echo -e '     -y:  Install modules with Yarn'        
        echo -e '     -o:  Open repository in VSCode'
        echo -e '     -p:  Read `package.json` in terminal\n'
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

    if test -z "$REST"
        set currPWD (eval pwd)
        #echo 'no second arg passed'
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
        set newRepo (string split / "$repoToClone")[-1]

        getopts $REST | while read -l key options
            switch $key
                case _
                    set_color cyan
                    echo -e "\n - New local repo will be `$newNameOrFlag` \n"

                    set_color normal
                    git clone https://github.com/$repoToClone.git $newNameOrFlag
                    cd $newNameOrFlag

                    set currPWD (eval pwd)

                    getopts $flag | while read -l selected flags
                        switch $selected
                            case _
                                echo -e 'ERROR: unknown option or default'
                            case r
                                set_color green
                                echo -e "\n - Running"
                            case i
                                set_color green
                                echo -e '\n - Installing Node Modules...\n'
                                set_color normal
                                npm install
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

                case i
                    git clone https://github.com/$repoToClone.git
                    cd $newRepo

                    set_color green
                    echo -e '\n - Installing Node Modules...\n'
                    set_color normal
                    npm install
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
