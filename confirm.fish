# Defined in - @ line 2
function confirm
	set promptStr (echo -e ' '$MG$B'' $N$MG$I$U'Prompt'$N$WH$B$D' ⇨ '$N"Are you sure? (y\\\N) ")
    set answer 'N'
    while not test $answer = 'Y'
        read -P "$promptStr" answer
        echo -e "\nANSWER = $answer"
    end
end
