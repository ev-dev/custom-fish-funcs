# Defined in - @ line 2
function aws-prod
	echo -e '\tConnecting...'
    ssh -i /Users/admin/.config/aws/production-api.pem ev-dev@52.90.169.218
end
