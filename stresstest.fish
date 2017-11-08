# Defined in - @ line 1
function stresstest
    set_color cyan
    echo -e "\n - Stress Testing: $argv -\n"

    set_color green
    set max_request_amount (seq 0 10000)
    for i in $max_request_amount
        echo -e " - request #$i to $argv"
        curl http://"$argv" >/dev/null
    end
end
