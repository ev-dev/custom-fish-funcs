# Defined in - @ line 2
function share
	#set pushToPhone (pb push -d 0 -u "$argv")
    #set pushToTablet (pb push -d 3 -u "$argv")
    set_color green
    echo -e "\n - Sharing to Phone & Tablet - \n"
    pb push -d 0 -u "$argv"
    pb push -d 3 -u "$argv"
    set_color normal
    #spin "$pushToPhone"
    #spin "$pushToTablet"
end
