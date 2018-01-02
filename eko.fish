# Defined in /Users/admin/.config/fish/functions/eko.fish @ line 2
function eko
	# set numArgs (count $argv)
    # echo -e "ARGV IS = $argv"
    # echo -e "ARGV COUNT = $numArgs"
    # echo -e "ARGV[1] IS = $argv[1]"
    # echo -e "ARGV[2] IS = $argv[2]"

    if test (count $argv) -lt 2
        echo -e "$argv$N"
    else
        if [ $argv[1] = '-n' ]
            set REST $argv[2..-1]
            set FINAL_STR ""
            for arg in $REST
                set FINAL_STR $FINAL_STR "$arg$N"
            end
            echo -e "\n$FINAL_STR\n"
        else
            set flags (echo "$argv[1]" | string escape | string sub -s 2)
            set REST $argv[2..-1]
            set FINAL_STR ""
            for arg in $REST
                set FINAL_STR $FINAL_STR "$arg$N"
            end

            # set firstCap (string upper (string sub -l 1 $FINAL_STR))
            set CAP_STR (string upper (string sub -s 2 -l 1 "$FINAL_STR"))(string sub -s 3 "$FINAL_STR")
            # set firstCap (string upper $firstCh)
            # set remChars (string sub -s 3 "$FINAL_STR")
            # set CAP_STR "$firstCap$remChars"
      
#            strup $FINAL_STR
#            echo "cappedString is:  $cappedString"

#            set CAP_STR $cappedString
 #           set -e cappedString
            
            switch $flags
                case _
                    echo -e '\nhit _ ' #> /dev/null
                    echo -e '$flags  =  '"$flags" #> /dev/null
                    echo -e '$argv  =  '"$argv\n" #> /dev/null

                # DEFAULT option (used for Beginning or Processing a task)
                case d P B beg
                    echo -e $YL$B'\n\t '$YL$B$I$U'Process'$N$WH$B$D'  '$N"$CAP_STR...\n"

                # used for informational messages
                case I info
                    echo -e $BL$B'\n\t    '$N$BL$I$U'Info'$N$WH$B$D'  '$N"$CAP_STR\n"

                # used for success messages
                case S success
                    echo -e $GR'\n\t '$GR$I$U'Success'$N$WH$B$D'  '$N"$CAP_STR\n"

                # used for error messages
                case E ERR error
                    echo -e $RD'\n\t   '$RD$B$I$U'Error'$N$WH$B$D'  '$N"$CAP_STR\n"

                # used for warning messages
                case W warn
                    echo -e $PR$B'\n\t '$N$PR$I$U'Warning'$N$WH$B$D'  '$N"$CAP_STR\n"
                                
                case ln nl NL NLS NLBA NLAB nw nwlns lns lines
                    echo -e "\n$FINAL_STR\n"
                case lb nlb NLB LB lnb lnbf lnbefore bef bf
                    echo -e "\n$FINAL_STR"
                case la nla NLA LA lna lnaf lnafter aft af
                    echo -e "$FINAL_STR\n"
                case ld nld NLD LD lnd lndb lndub lndouble dub db
                    echo -e "\n\n$FINAL_STR\n\n"

                case t z T TB tb tab
                    echo -e "\t$FINAL_STR"
                case nt lt lnt lntb nlt nltb NLT NLTB LNT
                    echo -e "\n\t$FINAL_STR\n"
                case lbt nlbt TNLTB tNLTB NLTT NLTTB
                    echo -e "\n\t$FINAL_STR"
                case lat nlat BNLTB bNLTB NLAT NLBTB
                    echo -e "\t$FINAL_STR\n"
                case ldt nldt DNLTB dNLTB NLDT NLDTB
                    echo -e "\n\n$FINAL_STR\n\n"

                case 2sp sp2
                    echo -e "  $FINAL_STR"
                case n2sp nl2sp ln2sp nsp2 nlsp2
                    echo -e "\n  $FINAL_STR\n"
                case nla2sp
                    echo -e "  $FINAL_STR\n"
                case nlb2sp
                    echo -e "\n  $FINAL_STR"

                case 4sp sp4
                    echo -e "    $FINAL_STR"
                case n4sp nl4sp ln4sp nsp4 nlsp4
                    echo -e "\n    $FINAL_STR\n"
                case nla4sp
                    echo -e "    $FINAL_STR\n"
                case nlb4sp
                    echo -e "\n    $FINAL_STR"

                case 6sp sp6
                    echo -e "      $FINAL_STR"
                case n6sp nl6sp ln6sp nsp6 nlsp6
                    echo -e "\n      $FINAL_STR\n"
                case nla6sp
                    echo -e "      $FINAL_STR\n"
                case nlb6sp
                    echo -e "\n      $FINAL_STR"

                case '*'
                    echo 'hit star'
                    set normalized
                    for arg in $argv
                        set normalized $normalized "$arg$N"
                    end
                    echo -e "$normalized"
            end
        end
    end
end
