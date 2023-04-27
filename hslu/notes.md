alias backbone='cd ~/g09/g09-backbone'
alias service='cd ~/g09/g09-service'
alias gateway='cd ~/g09/g09-gateway'
alias docs='cd ~/g09/g09-documentation'
alias demo='cd ~/g09/g09-demo'

dc () {
	if [[ -z $1 ]]
	then
		echo "Usage: dc <keyword>"
		return 1
	fi
	cd ~/g09/g09-backbone && docker-compose -f stack.local.yml $1
}

# show ps
backbone
docker-compose -f stack.local.yml ps


http://app.g09-gateway.swda-g09.el.eee.intern/api/v1/users

http://discover.swda-g09.el.eee.intern/#/stacks
http://portainer.swda-g09.el.eee.intern/#!/auth

curl http://app.g09-gateway.swda-g09.el.eee.intern/api/v1/articles/articles

curl http://127.0.0.1:8090/api/v1/articles/articles
