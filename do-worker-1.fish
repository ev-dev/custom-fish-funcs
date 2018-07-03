# Defined in - @ line 2
function do-worker-1
	mosh evdev@206.189.255.176 --ssh="/usr/local/bin/ssh -i ~/.ssh/digitalocean-key"
    #mosh evdev@206.189.255.176
end
