# Defined in - @ line 2
function prompt
	set promptStr (echo -e ' '$MG$B'' $N$MG$I$U'Prompt'$N$WH$B$D' ⇨ '$N"$argv")
    read -P "$promptStr" answer
    echo -e "\nANSWER = $answer"
end
