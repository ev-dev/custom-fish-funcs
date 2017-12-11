# Defined in /Users/admin/.config/fish/functions/eko.fish @ line 2
function copy-eko
	# if test (count $argv) -gt 1
        # set flags $argv[1]
        # set REST $argv[2..-1]

        getopts $argv | while read -l flag options
            switch $flag
                case _
                    echo -e '\nhit _ ' #> /dev/null
                    echo -e '$flag  =  '"$flag" #> /dev/null
                    echo -e '$argv  =  '"$argv\n" #> /dev/null
                    # echo -e "$flags$REST""$N"
                case nwln # lns lines
                    echo 'Hit newlines case'
                    echo -e "\n$argv""$N\n"
                    # echo -e "\n$REST""$N\n"
                case bef # lb LB lnb lnbf lnbefore
                    echo -e "\n$argv""$N"
                case aft # la LA lna lnaf lnafter
                    echo -e "$argv""$N\n"
                case dub # ld LD lnd lndb lndub lndouble
                    echo -e"\n\n$argv""$N\n\n"
                    # case c C cl CL clr color
                    #     echo -e "$argv[2]""$argv[3..-1]""$N"
                case '*'
                    echo -e '\nhit * \n' #> /dev/null
                    echo -e '$flag  =  '"$flag" #> /dev/null
                    echo -e '$argv  =  '"$argv\n" #> /dev/null
                    # echo -e "$flags$REST""$N"
            end
        end
    # else
    #     echo -e "$argv""$N"
    # end
end
