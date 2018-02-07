# Defined in - @ line 1
function init_color_aliases
	set -g N (set_color normal)
    set -g I "\e[3m"
    set -g B (set_color -o)
    set -g U (set_color -u)
    set -g D (set_color 777)

    set -g WH (set_color white)
    set -g YL (set_color yellow)
    set -g BL (set_color blue)
    set -g BL2 (set_color 0096FF)
    set -g CY (set_color cyan)
    set -g RD (set_color red)
    set -g GR (set_color green)
    set -g GR2 (set_color 036B03)
    set -g DGR (set_color 036B03)
    set -g PR (set_color purple)
    set -g MG (set_color magenta)
end
