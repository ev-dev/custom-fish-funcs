function pblk
    set -l device $argv[1]
    pb push -d $device -u $argv[2]
end
