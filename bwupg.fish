function bwupg
	set brewCMD "brew upgrade "
if [ $argv ]
spin "$brewCMD $argv"
else
spin "$brewCMD"
end
end
