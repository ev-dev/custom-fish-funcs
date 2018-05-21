# Defined in - @ line 1
function ssh:prod
	ssh -i /Users/admin/.config/aws/ec2-beta-prod.pem ev-dev@ec2-54-165-190-84.compute-1.amazonaws.com
end
