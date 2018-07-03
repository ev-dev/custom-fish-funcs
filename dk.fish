# Defined in - @ line 2
function dk
	if test -z "$argv"
        docker ps -a
    else
        set cmd "$argv[1]"

        if [ $cmd = 'ls' ]
            inf -b 'All Docker Images'
            docker image ls
            inf -b 'All Docker Containers'
            docker ps -a

        else if [ $cmd = 'rm' ]
            set containerID "$argv[2]"
            proc 'removing docker container'
            docker stop $containerID >/dev/null
            docker rm $containerID >/dev/null
            suc "removed ContainerID: $containerID"

        else if [ $cmd = 'rmi' ]
            set imgListNums $argv[2..-1]

            set images (string split '\n' (docker image ls -a))[2..-1]

            for imageNum in $imgListNums
                set imgToRm $images[$imageNum]
                set imgID (string replace -r '^([\S]*)([\s]*)([\S]*)([\s]*)([\S]*)(.*)' '$5' "$imgToRm")
                proc -ba "removing Docker ImageID: "$YL"$imgID"
                docker image rm "$imgID"
                inf -b 'removed image'
            end
            suc -ba 'Removed selected images'
            docker image ls

        else if [ $cmd = 'build' ]
            proc 'building container with docker-compose'
            docker-compose up -d
            suc 'complete.'

        else
            docker $argv
        end
    end
end
