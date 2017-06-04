function bwup
	set brewCMD "brew update "

    if [ $argv ]
        spin "$brewCMD $argv"
    else
        spin "$brewCMD"
    end
end
