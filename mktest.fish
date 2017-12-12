# Defined in /Users/admin/.config/fish/functions/mktest.fish @ line 2
function mktest
	set ital (set_color normal)
    set dim (set_color normal)
    set trueDim (set_color 989898)
    set blueU (set_color blue -u)
    set blue (set_color blue -o)
    set green (set_color green)
    set greenB (set_color green -o)
    set yellow (set_color yellow -u -o)
    set red (set_color red)

<<<<<<< HEAD
    cd $tests
    
=======
    cd ~/webdev/JS/test-projects

>>>>>>> master
    if test -z "$argv"
        #eko -nl 'No Args.. just cding'
    
    else if begin
            or [ $argv[1] = '--help' ]
            or [ $argv[1] = '-h' ]
            or [ $argv[1] = 'help' ]
        end
        
        eko -nlt $YL'\tMakeTest' $N$D'(Custom Command)'
        eko -nlat 'Project generator for testing things quickly\n\t with no other setup required.'
        
        eko -nlat $U$BL'Usage'$N':' $B$GR'mktest' $N'['$BL'options'$N'] or ['$BL'existing project'$N']'
        
        eko -nlat $U$BL'Options'$N':'
        eko -t $GR'-t'$N',' $GR'--type' $N'['$BL'type'$N'] ['$BL'new project name'$N']'
        echo -e '\t   '"$dim"'Generates new project from customized\n\t   boilerplates and begins tracking with git\n'

        eko -t $GR'-cl'$N',' $GR'--clone' $N'['$BL'clone options'$N']'
        echo -e '\t   '"$dim"'Generates new project from remote repository\n'
                        
        eko -nlat $U$BL'Boilerplate Types'$N':' $D'(defaults to empty)'
        echo -e '\t '"$green"'empty'"$dim"' - Scaffolds basic blank project'
        echo -e '\t '"$green"'static'"$dim"' - Basic static HTML, CSS, JS project'
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
            [ $argv[1] = '--clone' ]
            or [ $argv[1] = '-cl' ]
            or [ $argv[1] = '-c' ]
        end
        set cloneArgs $argv[2..-1]
        #eko -nl "cloneArgs = $cloneArgs"
        cl $cloneArgs
        
    else if begin
            [ $argv[1] = '--type' ]
            or [ $argv[1] = '-t' ]
        end

        if begin
                [ $argv[2] = 'empty' ]
                or [ $argv[2] = 'blank' ]
            end
            mkd ./"$argv[3]"
            spin "git init > /dev/null"

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
                    eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'React/Redux/Express/Sequelize/GraphQL' $N' pNoject...'
                    eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'
                    spin "git clone -b fullstack-graphql git@github.com:ev-dev/ev-dev-starter.git "$argv[5]" > /dev/null"

                else
                    eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'React/Redux/Express/Sequelize' $N' pNoject...'
                    eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'
                    spin "git clone -b react-redux-express-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
                    rm -rf ./.git
                    spin "git init > /dev/null"
                    echo ' '
                    spin "yarn > /dev/null"
                    spin "cm 'Initial Commit: Forked from custom full starter' > /dev/null"
                end
            end

        else if [ $argv[2] = 'static' ]
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'Static' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'
            
            spin "git clone -b static git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom basic Static starter' > /dev/null"
            
        else if [ $argv[2] = 'node' ]
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'Basic Node.js' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'
            
            spin "git clone -b node git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom basic Node.js starter' > /dev/null"
            

        else if begin
                [ $argv[2] = 'exp' ]
                or [ $argv[2] = 'express' ]
            end
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'Express' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'

            spin "git clone -b express git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom express-sequelize starter' > /dev/null"

        else if [ $argv[2] = 'exp-seq' ]
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'Express/Sequelize' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'

            spin "git clone -b express-sequelize git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom express-sequelize starter' > /dev/null"

        else if [ $argv[2] = 'react' ]
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'React' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'

            spin "git clone -b react git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom react starter' > /dev/null"

        else if begin
                [ $argv[2] = 'redux' ]
                or [ $argv[2] = 'react-redux' ]
            end
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'React/Redux' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'

            spin "git clone -b react-redux git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked custom react-redux starter' > /dev/null"

        # Blank project (same as -t empty)
        else
            eko -nlbt $blB'*' $I$BL'Selected' $N'create new' $U$I$B$BL'Node.js' $N'project'
            eko -nlt $ylB'*' $I$YL'Generating' $N'and' $I$YL'installing' $N'dependencies...'

            spin "git clone -b node git@github.com:ev-dev/ev-dev-starter.git "$argv[3]" > /dev/null"
            cd "$argv[3]"
            rm -rf ./.git
            spin "git init > /dev/null"
            spin "yarn > /dev/null"
            spin "cm 'Initial Commit: Forked from custom basic Node.js starter' > /dev/null"
        end

        spin "code ."
        eko -nlt $grB'*' $I$GR'Complete'
    end
end
