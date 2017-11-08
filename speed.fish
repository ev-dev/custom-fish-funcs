# Defined in /Users/admin/.config/fish/functions/speed.fish @ line 2
function speed
	set runTimes 3
    set logFile ~/.config/speedtest/speedtestLog.js

    if test -n "$argv"
        set runTimes $argv
    end

    set_color -u cyan
    echo -e '\n    Executing SpeedTest '"$runTimes"'x for Accuracy    \n'
    set_color normal

    spin "runSpeedTest $runTimes"

    node ~/.config/speedtest/calculateAvgSpeed.js

    rm $logFile
end
