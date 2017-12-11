# Defined in /Users/admin/.config/fish/functions/speed.fish @ line 2
function speed
	set logFile /Users/admin/.config/speedtest/speedtestLog.js
    set calcAvgSpeed /Users/admin/.config/speedtest/calculateAvgSpeed.js

    if test -n "$argv"
        set runAmount $argv
    else
        set runAmount 1
    end
    eko -NLTB $bU"Executing $runAmount Net Speed Tests"

    touch $logFile
    echo 'module.exports = `' >>$logFile
    
    if test $runAmount -eq 1
        eko -TB $B'-' $yI'Test in progress...'
        spin "speedtest >>$logFile"
    else
        for i in (seq $runAmount)
            if test "$i" = "$runAmount"
                eko -TB $B'-' $yI'Final test in progress...'
                spin "speedtest >>$logFile"
            else
                eko -TB $B'-' $yI"Test #$i in progress..."
                spin "speedtest >>$logFile"
                eko -NLBTB $B'-' $dg'Finished.'
            end    
        end
    end

    echo '`' >>$logFile
    eko -TB $B'-' $dgB'All tests complete.'
    eko -NLTB $dim'----------------------------'

    node $calcAvgSpeed
    # spin "node $calcAvgSpeed"
    # spin "runSpeedTest $runTimes"
    # spinpy runSpeedTest $runTimes

    rm $logFile
end
