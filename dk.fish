# Defined in - @ line 2
function dk
	if test -z "$argv"
        docker ps -a
    end
    set cmd "$argv[1]"
    if [ $cmd = 'rm' ]
        set containerID "$argv[2]"
        inf 'removing docker container...'
        docker stop $containerID >/dev/null
        docker rm $containerID >/dev/null
        suc "removed ContainerID: $containerID"
    end
    if [ $cmd = 'build' ]
        inf 'building container with docker-compose...'
        docker-compose up -d
        suc 'complete.'
    end
end
