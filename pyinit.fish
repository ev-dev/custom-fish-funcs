# Defined in - @ line 2
function pyinit
	set cwd (string split / (pwd))[-1]
    set venv (string join '' '.' "$cwd" '_venv')

    proc 'initializing Python virtual environment'

    git init >/dev/null

    echo -e "$venv\n__pycache__\n" >./.gitignore

    virtualenv -p python3 "$venv" >/dev/null
    bass source "$venv/bin/activate" >/dev/null ^/dev/null

    pip3 freeze >requirements.txt

    cm 'Initial Commit: Python virtual environment established' >/dev/null

    suc 'complete'
end
