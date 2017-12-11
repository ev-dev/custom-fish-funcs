# Defined in /Users/admin/.config/fish/functions/runSpeedTest.fish @ line 2
function runSpeedTest
	set runTimes 3
    set logFile "/Users/admin/.config/speedtest/speedtestLog.js"

    if test -n "$argv"
        set runTimes $argv
    end

    touch "$logFile"
    echo 'module.exports = `' >>$logFile

    for i in (seq $argv)
        speedtest >>$logFile
    end

    echo '`' >>$logFile
end
