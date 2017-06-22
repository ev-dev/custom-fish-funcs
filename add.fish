function add
	if test -d ./.git
        git add .
    else
        git init
        git add .
    end
end
