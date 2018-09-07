# Defined in - @ line 2
function k
	if test "$argv[1]" = "add-config"
        echo -e "\nSetting context AND adding k8s config file to \$KUBECONFIG..."

        if test -n "$KUBECONFIG"
            echo -e "\nCurrent \$KUBECONFIG:"
            for curr_config in $KUBECONFIG
                echo " - $curr_config"
            end
            echo " "

            set notverified 'true'
            set input_var 'empty'
            set abs_input 'also empty'
            while test $notverified = 'true'
                set cwdvar (string replace '/Users/admin' '~' (pwd))
                set promptstr "' $cwdvar
 # '"
                set inputval (bash -c "read -e -p $promptstr innervar && echo \$innervar")
                if test -f $inputval
                    set notverified 'false'
                    set input_var $inputval
                    set abs_input (eval /usr/local/Cellar/coreutils/8.30/libexec/gnubin/realpath "$inputval")
                    set -gx KUBECONFIG $KUBECONFIG $abs_input
                end
            end            
            if test -n "$KUBECONFIG"
                echo -e "\nUpdated \$KUBECONFIG:"
                for config_path in $KUBECONFIG
                    echo " - $config_path"
                end

                echo -e "\nRunning get-contexts...\n"
                kubectl config get-contexts
            end
        else
            echo -e "\nCurrent \$KUBECONFIG is empty."
            echo " "

            set notverified 'true'
            set input_var 'empty'
            set abs_input 'also empty'
            while test $notverified = 'true'
                set cwdvar (string replace '/Users/admin' '~' (pwd))
                set promptstr "' $cwdvar
 # '"
                set inputval (bash -c "read -e -p $promptstr innervar && echo \$innervar")
                if test -f $inputval
                    set notverified 'false'
                    set input_var $inputval
                    set abs_input (eval /usr/local/Cellar/coreutils/8.30/libexec/gnubin/realpath "$inputval")
                    set -gx KUBECONFIG $abs_input
                end
            end            
            if test -n "$KUBECONFIG"
                echo -e "\nUpdated \$KUBECONFIG:"
                for config_path in $KUBECONFIG
                    echo " - $config_path"
                end

                echo -e "\nRunning get-contexts...\n"
                kubectl config get-contexts
            end
        end
    else
        kubectl $argv
    end
end
