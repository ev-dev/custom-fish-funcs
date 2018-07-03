# Defined in - @ line 2
function lab-runner
	if test "$argv" = 'register'
        or test "$argv" = '--register'
        or test "$argv" - '-r'

        docker run --rm -t -i -v /Users/shared/gitlab-runner/config:/etc/gitlab-runner --name gitlab-runner gitlab/gitlab-runner register --non-interactive --executor "docker" --docker-image alpine:3 --url "https://gitlab.com/" --registration-token "sAv1HWxyS87-LCq1L93N" --description "gitlab-runner" --tag-list "docker,aws" --run-untagged --locked="false"

    else if test "$argv" = 'start'
        docker run -d --name gitlab-runner --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /Users/shared/gitlab-runner/config:/etc/gitlab-runner -it gitlab/gitlab-runner:latest sh

    else if test "$argv" = 'logs'
        docker logs gitlab-runner

    else
        err unknown option "$argv"
    end
end
