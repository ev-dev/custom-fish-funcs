# Defined in /Users/admin/.config/fish/functions/mktest_spin.fish @ line 2
function mktest_spin
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

    cd ~/webdev/JS/test-projects
    if begin
            test -z "$argv"
            or [ $argv[1] = '--help' ]
            or [ $argv[1] = '-h' ]
            or [ $argv[1] = 'help' ]
        end
        echo -e '\n\t\t'"$yellow"'Make Test'"$normal"'  '"$trueDim"'(Custom Command)\n'
        echo -e '\t'"$normal"'Project generator for testing things quickly\n\twith no other setup required.\n'

        echo -e '\t'"$blueU"'Usage'"$normal"':  '"$greenB"'mktest'"$normal"' ['"$blue"'options'"$normal"'] or ['"$blue"'existing project'"$normal"']\n'
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
                    set_color cyan
                    echo -e '\n\t- Selected create new React/Redux/Express/Sequelize/GraphQL project...'
                    set_color yellow
                    echo -e '\n\t- Generating...\n'
                    set_color normal
                    git clone -b fullstack-graphql git@github.com:ev-dev/ev-dev-starter.git "$argv[5]"

                else
                    set_color cyan
                    echo -e '\n\t- Selected create new React/Redux/Express/Sequelize project...'
                    set_color yellow
                    echo -e '\n\t- Generating...\n'
                    set_color normal
                    git clone -b express-sequelize-react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
                    rm -rf ./.git
                    git init
                    echo ' '
                    yarn
                    cm 'Initial Commit: Forked from custom full starter'
                    echo ' '
                    code .
                end
            end

        else if [ $argv[2] = 'node' ]
            set_color cyan
            echo -e '\n\t- Selected create new Basic Node.js project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal
        
            spinpy git clone -b node git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            # git clone -b node git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked from custom basic Node.js starter'
            echo ' '
            code .
        
        else if begin
                [ $argv[2] = 'exp' ]
                or [ $argv[2] = 'express' ]
            end
            set_color cyan
            echo -e '\n\t- Selected create new Express project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal

            git clone -b express git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked from custom express-sequelize starter'
            echo ' '
            code .

        else if [ $argv[2] = 'exp-seq' ]
            set_color cyan
            echo -e '\n\t- Selected create new Express/Sequelize project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal

            git clone -b express-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked from custom express-sequelize starter'
            echo ' '
            code .

        else if [ $argv[2] = 'react' ]
            set_color cyan
            echo -e '\n\t- Selected create new React project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal

            git clone -b react git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" >temp.txt ^&̦1
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked from custom react starter'
            echo ' '
            code .

        else if begin
                [ $argv[2] = 'redux' ]
                or [ $argv[2] = 'react-redux' ]
            end
            set_color cyan
            echo -e '\n\t- Selected create new React/Redux project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal

            git clone -b react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked custom react-redux starter'
            echo ' '
            code .

            # Blank project (same as -t empty)
        else
            set_color cyan
            echo -e '\n\t- Selected create new Node.js project'
            set_color yellow
            echo -e '\n\t- Generating...\n'
            set_color normal

            git clone -b node git@github.com:ev-dev/ev-dev-starter.git "$argv[3]"
            cd "$argv[3]"
            rm -rf ./.git
            git init
            echo ' '
            yarn
            cm 'Initial Commit: Forked from custom basic Node.js starter'
            echo ' '
            code .
        end
    end
end
