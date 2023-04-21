alias backbone='cd ~/g09/g09-backbone'
alias service='cd ~/g09/g09-service'
alias gateway='cd ~/g09/g09-gateway'
alias docs='cd ~/g09/g09-documentation'
alias demo='cd ~/g09/g09-demo'

# show ps
backbone
docker-compose -f stack.local.yml ps


http://app.g09-gateway.swda-g09.el.eee.intern/api/v1/users

http://discover.swda-g09.el.eee.intern/#/stacks
http://portainer.swda-g09.el.eee.intern/#!/auth

curl http://app.g09-gateway.swda-g09.el.eee.intern/api/v1/articles/articles
