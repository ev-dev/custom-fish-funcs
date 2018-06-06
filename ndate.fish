# Defined in - @ line 2
function ndate
	cop (string replace -a -r '[\n]+' '' (node -p 'new Date()'))
end
