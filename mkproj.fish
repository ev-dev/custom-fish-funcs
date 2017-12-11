# Defined in /Users/admin/.config/fish/functions/mkproj.fish @ line 2
function mkproj
	set normal (set_color normal)
    set ital (set_color normal)
    set dim (set_color normal)
    set trueDim (set_color 989898)
    set blueU (set_color blue -u)
    set blue (set_color blue -o)
    set green (set_color green)
    set greenB (set_color green -o)
    set yellow (set_color yellow -u -o)
    set red (set_color red)

    cd ~/webdev/JS/local-dev-repos
    if begin
            test -z "$argv"
            or [ $argv[1] = '--help' ]
            or [ $argv[1] = '-h' ]
            or [ $argv[1] = 'help' ]
        end
        echo -e '\n\t\t'"$yellow"'Make Project'"$normal"'  '"$trueDim"'(Custom Command)\n'
        echo -e '\t'"$normal"'Quick template generator\n\tfor minimal setup of new projects.\n'

        echo -e '\t'"$blueU"'Usage'"$normal"':  '"$greenB"'mkproj'"$normal"' ['"$blue"'options'"$normal"'] or ['"$blue"'existing project'"$normal"']\n'
        echo -e '\t'"$blueU"'Options'"$normal"':\n'
        echo -e '\t '"$green"'-t'"$normal"', '"$green"'--type '"$normal"' ['"$blue"'type'"$normal"'] ['"$blue"'new project name'"$normal"']'
        echo -e '\t   '"$dim"'Generates new project from customized\n\t   boilerplates and begins tracking with git\n'

        echo -e '\t'"$blueU"'Boilerplate Types'"$normal"':    (defaults to empty)\n'
        echo -e '\t '"$green"'empty'"$dim"' - Scaffolds basic blank project'
        echo -e '\t '"$green"'node'"$dim"' - Blank nodejs setup'
        echo -e '\t '"$green"'exp'"$dim"' - Basic express server'
        echo -e '\t '"$green"'exp-seq'"$dim"' - Express server with postgresSQL'
        echo -e '\t '"$green"'react'"$dim"' - Simple react setup'
        echo -e '\t '"$green"'redux'"$dim"' - React with redux setup'
        echo -e '\t '"$green"'full'"$dim"' - Express, sequelize, react, react-redux'
        echo -e '\t   '"$green"'-o'"$dim"' - More options for full template'
        echo -e '\t   '"$green"'graphql'"$dim"' - Create with a GraphQL API\n'

        set_color normal
    else if begin
            [ $argv[1] = '--type' ]
            or [ $argv[1] = '-t' ]
        end

        set_color green
        echo -e " - Selected create new $argv[2] project.\n"

        set_color cyan
        if begin
                [ $argv[2] = 'empty' ]
                or [ $argv[2] = 'blank' ]
            end
            mkd ./"$argv[3]"
            git init
            echo ' '

        else if begin
                [ $argv[2] = 'full' ]
                or [ $argv[2] = 'fullstack' ]
                or [ $argv[2] = 'nerp' ]
            end
            if begin
                    [ $argv[3] = '--options' ]
                    or [ $argv[3] = '-o' ]
                end
                if begin
                        [ $argv[4] = 'graphql' ]
                        or [ $argv[4] = 'gql' ]
                    end
                    echo -e ' - Generating new react/redux/express/sequelize/graphql project... -\n'
                    git clone -b fullstack-graphql git@github.com:ev-dev/ev-dev-starter.git "$argv[5]"

                else
                    echo -e ' - Generating new react/redux/express/sequelize project... -\n'
                    git clone -b express-sequelize-react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                    rm -rf ./.git
                    git init
                    echo ' '
                    npm install
                    cm 'Initial Commit: Forked from custom full starter'
                    echo ' '
                    code .
                end

            else if [ $argv[2] = 'node' ]
                echo -e ' - Generating basic node.js project -\n'
                mkdir ./"$argv[3]"
                cd "$argv[3]"
                git init
                npm init -y
                touch app.js
                add
                cm 'Initial Commit: Only contains blank .js file'
                echo ' '
                code .

            else if begin
                    [ $argv[2] = 'exp' ]
                    or [ $argv[2] = 'express' ]
                end
                echo -e ' - Generating express/sequelize project -\n'
                git clone -b express git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom express-sequelize starter'
                echo ' '
                code .

            else if [ $argv[2] = 'exp-seq' ]
                echo -e ' - Generating express/sequelize project -\n'
                git clone -b express-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom express-sequelize starter'
                echo ' '
                code .

            else if [ $argv[2] = 'react' ]
                echo -e ' - Generating new react project -\n'
                git clone -b react git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" >temp.txt ^&̦1
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked from custom react starter'
                echo ' '
                code .

            else if begin
                    [ $argv[2] = 'redux' ]
                    or [ $argv[2] = 'react-redux' ]
                end
                echo -e ' - Generating new react-redux project -\n'
                git clone -b react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                cd "$argv[3]"
                rm -rf ./.git
                git init
                echo ' '
                npm install
                cm 'Initial Commit: Forked custom react-redux starter'
                echo ' '
                code .
            end

            # Blank project (same as -t empty)
        else
            echo -e " - Selected create new empty project.\n"
            mkd ./"$argv[2]"
            git init
            echo ' '
        end
    end
end
