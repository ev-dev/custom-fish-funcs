# Defined in - @ line 2
function ip
	proc -a 'Resolving Current IP Address'
    set addr (curl -s http://ipinfo.io/ip)
    echo $addr | pbcopy
    suc "Current IP: $addr (copied to clipboard)"
end
