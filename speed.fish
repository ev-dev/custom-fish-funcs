function speed
    echo -e '\n-----------------------------------'
    echo -e 'Executing SpeedTest 5x for Accuracy'
    echo -e '-----------------------------------\n'
    echo -e '\n----------- Round 1 ------------\n'
    spin "speedtest --timeout 30"
    echo -e '\n------------ Round 2 ------------\n'
    spin "speedtest --timeout 30"
    echo -e '\n------------ Round 3 ------------\n'
    spin "speedtest --timeout 30"
    echo -e '\n---------- COMPLETE -----------\n\n'
end
