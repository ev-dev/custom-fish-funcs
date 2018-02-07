# Defined in - @ line 1
function init_dir_aliases
	set -g tmp ~/temp
    set -g temp ~/temp
    set -g dl ~/Downloads
    set -g desktop ~/Desktop
    set -g gdrive ~/Google\ Drive
    set -g docs ~/Documents
    set -g conf ~/.config
    set -g config ~/.config
    set -g utils "$conf/system-utilities"

    set -g dev ~/dev
    set -g prod "$dev/production"
    set -g q "$prod/quartolio"

    set -g js "$dev/js"
    set -g py "$dev/python"
    set -g learn "$js/learn-js"
    set -g prep "$learn/interview-prep"
    set -g tests "$js/test-projects"
    set -g local "$js/local-dev-repos"
    set -g tools "$js/tools"
end
