function bwug
	set brewCMD "brew upgrade "
    if [ $argv ]
        echo -e "  - Upgrading `$argv` -\n\n"
        spin "$brewCMD $argv"
    else if test "$argv" = "-a"
        echo -e '  - Upgrading ALL Packages -\n\n'
        spin "$brewCMD"
    else
        echo -e '  - ERROR (Bad Usage) -\n\n `bwug` command needs an argument (packages to upgrade or `-a` for all packages)'
    end
end
