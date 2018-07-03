# Defined in - @ line 2
function compose
	docker-compose $argv build
    docker-compose $argv up
end
