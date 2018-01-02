# Defined in - @ line 2
function deps
	#set dep (string replace -r -a '[\{\}"]' '' (cat package.json | jq '.dependencies'))
    #set devDeps (string replace -r -a '[\{\}"]' '' (cat package.json | jq '.devDependencies'))

    set formatted (string replace -r -a '[\{\}"]+' '' (pk -d))
    echo "$formatted"
end
