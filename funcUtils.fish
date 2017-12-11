function funcUtils
    path "$argv[1]" ^~/error.txt
    if test $status -eq 0
        echo 'is executable command'
    else
        echo -e "\n\n
#=====================   Fish Shell Custom Function Utility   ========================#
#                                                                                     #
#  Multi-purpose utility command for use within other custom fish functions.          #
#  Can autogenerate documentation and/or handle errors descriptively                  #
#  based on the flags and options it is passed                                        #
#                                                                                     #
#  >>> funcUtils cmdname  [utility mode] | [option flag] | [option value]             #
#                                                                                     #
#                                                                                     #
#              MODES  ->  [-docs, -handler, -define]                                  #
#                                                                                     #
#       Docs Options  ->  [-a/-all, -c/-compact, -u/-usage, -desc, -p/-param]         #
#                                                                                     #
#    Handler Options  ->  [-A/-active, -V/-validate, -X/-expect, -M/-message]         #
#                                                                                     #
#     Define Options  ->  [-usage, -param, -desc, -expect, -validate, -message]       #
#                                                                                     #
#                                                                                     #
#=====================================================================================# 
#------------------------------    USAGE OVERVIEW    ---------------------------------# 
#=====================================================================================# 
#                                                                                     #
#                                                                                     #
#   <>  First parameter is always the name of the command funcUtils will act on  <>   #
#                                                                                     #
#                             ---------------------                                   #
#                              1).  \"COMMAND NAME\"                                  #
#                             ---------------------                                   #
#                                                                                     #
#      > funcUtils mycustomcmd                                                        #
#                                                                                     #
#_____________________________________________________________________________________#
#                                                                                     #
# <> Second parameter is the main options flag for dictating funcUtils's behavior  <> #
#                                                                                     #
#                            ------------------------                                 #       
#                             2). \"MODE OPTION FLAG\"                                #       
#                            ------------------------                                 #
#                                                                                     #
#      > funcUtils [handler, docs, -h/help]                                           #
#                                                                                     #
#          `--docs`:   For defining and displaying docs/help of a command             #
#                                                                                     #
#       `--handler`:   For defining and using custom error handling                   #
#                      capabilities of a command                                      #
#                                                                                     #
#        `--define`:   The most general MODE. Define characterisics of a command      #
#                      to enable the autogeneration of manuals/docs/help and error    #
#                      handling for it.                                               #
#                                                                                     #
#       `--help/-h`:   Show `funcUtils` internal manual/help                          #
#                                                                                     #
#                                                                                     #
#_____________________________________________________________________________________#
#                                                                                     #
# <>        All following parameters are pairs of option flags and values          <> #
#                                                                                     #
#                       ----------------------------------                            #
#                        3-4, 5-6... \"OPTION/VALUE PAIRS\"                           #
#                       ----------------------------------                            #
#                                                                                     #
#   *** The option flags must come before the desired values for each option! ***     #
#                                                                                     #
#   Alternating flag/value  ==>    --Option1 'value one'  --Option2 'value two'...    #
#                                                                                     #
#    NOTE: different option flags correspond to specific MODES (first parameter)      #
#                                                                                     #
#                                                                                     #
#         ---------------------   LIST OF OPTIONS    ------------------------         #
#                                                                                     #
#     `docs` Options                                                                  #
#          -a, -all       Show full documentation on command                          #
#          -c, -compact   Show only command usage and parameter information           #
#          -u, -usage     Usage information                                           #
#          -d, -desc      Command description                                         #
#          -p, -param     Parameter description                                       #
#                                                                                     #
#     `handler` Options                                                               #
#         -A, -active      Watch and throw custom errors                              #
#         -I, -intialize   Setup start condition for test case                        #
#         -C, -case        Define case parameters for test                            #
#         -T, -test        Define evalution leading to expectation                    #
#         -X, -expect      Define expected value after test                           #
#         -M, -message     Custom error message (define one after each param/expect)  #
#                                                                                     #
#                                                                                     #
#     `define` Options                                                                #
#         -u, -usage       Usage information                                          #
#         -p, -param       Parameter description                                      #
#         -d, -desc        Command description                                        #
#                                                                                     #
#         -I, -intialize   Setup start condition for test case                        #
#         -C, -case        Define case parameters for test                            #
#         -T, -test        Define evalution leading to expectation                    #
#         -X, -expect      Define expected value after test                           #
#         -M, -message     Custom error message (define one after each param/expect)  #
#                                                                                     #
#                                                                                     #
#=====================================================================================# 
#-----------------------------------    EXAMPLES    ----------------------------------# 
#=====================================================================================# 
#                                                                                     #
#       funcUtils cmdname  [utility mode] | [option flag] | [option value]            #
#                                                                                     #
#                                                                                     #
#  Docs Definition:                                                                   #
#       >>> funcUtils mkd --define \                                                  #
#		          -desc 'create and enter a new directory' \                          #
#        		  -usage 'my-new-folder' \                                            #
#		          -param 'the name/path of the new directory' \                       #
#       		  -message 'Invalid Path! Cannot create directory without \           #
#                           receiving relative path...'                               #
#                                                                                     #
#                                                                                     #
#  Handler Definition:                                                                #
#       >>> funcUtils mkd --define \                                                  #
#                 -I  'set currPath pwd' \         Initial Setup (store variable)     #
#                 -C 'test-folder' \               Case To Use As Command Parameter   #
#                 -T 'pwd' \                       Validation Command To Be Executed  #
#                 -X '$currPath/test-folder'       Expectation To Validate With       #
#                                                                                     #
#                                                                                     #
#=====================================================================================#\n\n"
    end
    if test true
        echo 'hi'
    end
end

# function usageError
#     set argsCount (count $argv)
#     set_color red

#     switch $argsCount
#         case 4
#             echo -e "\n  - ERROR: Bad Usage -"

#         case 3
#             echo -e "\n  - ERROR: Bad Usage -"
#             echo -e "\n  `$argv[1]` needs an argument ($argv[2])\n"
#             echo -e ""
#         case 2
#             echo -e "\n  - ERROR: Bad Usage -"

#         case '*'
#             echo -e "\n ONE OR NO ARGS"
#     end

#     # else if [ $argsCount -eq 2 ]
#     #     echo -e "\n  - ERROR: Bad Usage -"

#     #     isatty stdout
#     #     if test $status -eq 0
#     #         echo -e "\n  `$argv[1]` needs an argument ($argv[2])\n"
#     #     else
#     #         set_color yellow -u
#     #         if test $status -eq 0
#     #             echo -e "\n `$argv[1]` needs an arguemtn ($argv[2])\n"
#     #         end
#     #     end

#     # else
#     #     # interal error catch - problem with usageError itself
#     #     set_color red
#     #     echo -e "\n  - Problem with usageError handler! -"

#     #     set_color yellow
#     #     echo -e "  custom `usageError` function accepts a command and a argument description\n"

#     #     set_color cyan
#     #     echo -e "  Utility:"
#     #     set_color normal
#     #     echo -e "     invoke `usageError` as the default error handler when defining a new function\n"

#     #     set_color cyan
#     #     echo -e "  Usage:"
#     #     set_color normal
#     #     echo -e "    usageError 'mkd' 'the name & path of the new directory"

#     #     set_color red
#     #     echo -e "  -->  - ERROR: Bad Usage -\n       `mkd` needs an argument (the name & path of the new directory)\n"
#     # else if [ $argsCount -eq 2 ]

# end
