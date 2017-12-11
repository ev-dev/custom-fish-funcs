function chrome
	if [ $argv[1] = '-o' ]
        chrome-cli open http://www.$argv[2..-1]
    else
        chrome-cli $argv
    end
end
