function fish_prompt
    # Cache exit status
    set -l last_status $status

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    if not set -q __fish_prompt_char
        switch (id -u)
            case 0
                set -g __fish_prompt_char \u276f\u276f
            case '*'
                set -g __fish_prompt_char »
        end
    end

    # Setup colors
    set -l normal (set_color normal)
    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l bpurple (set_color -o purple)
    set -l bred (set_color -o red)
    set -l bcyan (set_color -o cyan)
    set -l bwhite (set_color -o white)

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true

    # Color prompt char red for non-zero exit status
    set -l pcolor $bpurple
    if [ $last_status -ne 0 ]
        set pcolor $bred
    end

    # Top
    echo -n $yellow$USER$bwhite':' $bred(prompt_pwd)$normal
    __fish_git_prompt

    echo

    # Bottom
    echo -n $pcolor$__fish_prompt_char $normal
end

source /Users/admin/.config/fish/config.fish

#----------------
# USER FUNCTIONS
#----------------

function ficonfig
    nano ~/.config/fish/functions/fish_prompt.fish
end

function mdn
    mdn-cli $argv
end

function config
    nano ~/.config/fish/functions/fish_prompt.fish
end

function fp
    sudo micro ~/.config/fish/functions/fish_prompt.fish
end

function newfuncnow
    touch ~/.config/fish/functions/$argv[1].fish
    echo -e function $argv[1]'\n\t'$argv[2] $argv[3] '$argv\nend' >>~/.config/fish/functions/$argv[1].fish
end

function newfunc
    touch ~/.config/fish/functions/$argv.fish
    echo -e function $argv'\n\nend' >>~/.config/fish/functions/$argv.fish
    micro ~/.config/fish/functions/$argv.fish
    source ~/.config/fish/functions/$argv.fish
end

function re
    source ~/.config/fish/functions/fish_prompt.fish
end

function b
    /usr/local/bin/bash
end

function bp
    nano ~/.bash_profile
end

function n
    nano $argv
end

function m
    micro $argv
end

function lsa
    ls -a $argv
end

function ...
    cd ../../$argv
end

function ....
    cd ../../../$argv
end

function mkd
    mkdir $argv
    cd $argv
end

function lst
    tree -C --du -h -L 3 -I node_modules --dirsfirst --filelimit 10 $argv
end

function treec
    tree -C --dirsfirst --filelimit 20 $argv
end

function rma
    rm -vrdf $argv
    clear
end

function rmv
    rm -v $argv
end

function rmd
    rm -vrdf $argv
end

function mvv
    mv -v $argv
end

function chperm
    sudo chmod -Rv 777 $argv
end

function mkex
    chmod a=x $argv
end

function yga
    yarn global add $argv
end

function e
    exit
end

function .
    cd ~
end

function cdls
    cd $arv
    ls
end

function l
    ls -1p $argv
end

function c
    cd $argv
    ls -1p
end

function j
    clear
end

function na
    nano $argv
end

function path
    echo -e {$PATH\\n}
end

function add
    git add .
end

function st
    git status
end

function bs
    git add .
    git commit -m "BS Commit"
end

function cm
    git add .
    git commit -m "$argv"
end

function ck
    git checkout $argv
end

function branches
    git branch --list -a
end

function gf
    git fetch --all
end

function push
    git push
end

function pull
    git pull
end

function log
    git log
end

function cl
    git clone https://github.com/$argv.git
end

function cmpsh
    git add .
    git commit -m "$argv"
    git push
end

function commitpush
    git add .
    git commit -m $argv
    git push
end

function fullstack
    cd /Users/admin/webdev/js-all/learn-js/fullstack
    ls
end

function webdev
    cd /Users/admin/webdev
    ls
end

function dev
    cd /Users/admin/dev
    ls
end

function learn
    cd /Users/admin/webdev/js-all/learn-js/
    ls
end

function nodeschool
    cd /Users/admin/webdev/js-all/learn-js/nodeschool
    ls
end

function jsa
    cd /Users/admin/webdev/js-all
    ls -1
end

function js
    cd ~/webdev/js-all/$argv
    ls -1
end

function nodeproj
    cd /Users/admin/webdev/js-all/node-projects
    ls -1
end

function local
    cd /Users/admin/webdev/js-all/local-dev-repos/$argv
    tree -C --dirsfirst --filelimit 20 -I node_modules
end

function localrepos
    cd /Users/admin/webdev/js-all/local-dev-repos
    ls -1
end

function react
    cd /Users/admin/webdev/js-all/react-projects
    ls
end

function sublime-node
    node
    .load ./$argv
end

function repl
    node-repl $argv
end

function npmls
    which npm
    npm ls -g --depth=0
end

function npmout
    which npm
    spin "npm outdated -g --depth=0"
end

function npmin
    npm install -g $argv
    clear
    which npm
end

function npms
    npm install --save $argv
    clear
end

function npmd
    npm install --save-dev $argv
    clear
end

function pack
    micro package.json
end

function npmr
    npm run $argv
end

function npmb
    npm run build
end

function npms
    npm run start
end

function __


    echo -e '\n\n\t----------------------------------\n\t---        * SEPERATER *       ---\n\t----------------------------------\n\n'


end

function brwsrc
    brew search $argv
    __


end

function csksrc
    brew cask search $argv
    __


end

function bw
    echo "       "
    brew info $argv


    __


end

function cskinfo
    echo "       "
    brew cask info Caskroom/cask/$argv
    __


end



function bwi
    for i in $argv

        if test (string sub -s 1 -l 2 $i) = 'c/'
            cskinfo (string sub -s 3 $i)
        else
            bw $i
        end
    end
end

function bws
    for i in $argv

        if test (string sub -s 1 -l 2 $i) = 'c/'
            csksrc (string sub -s 3 $i)
        else
            brwsrc $i
        end
    end
end


function bwinstall
    brew install $argv
    __
end

function cskinstall
    brew cask install $argv
    __
end

