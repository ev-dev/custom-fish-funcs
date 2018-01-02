# Defined in - @ line 2
function strup
	set -xg cappedString (string upper (string sub -l 1 "$argv"))(string sub -s 2 "$argv")
end
