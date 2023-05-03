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

# Links

Mongo viewer
http://127.0.0.1:8094/
http://127.0.0.1:8094/db/swda/users
http://127.0.0.1:8095/db/swda/articles




## Update Article 


curl -X PUT http://127.0.0.1:8090/api/v1/articles/64511d456069cf086eab7b16 \
  -H 'Content-Type: application/json' \
  -d '{
        "id": "64511d456069cf086eab7b16",
        "number": 1234,
        "name": "Hammerupdated",
        "price": 19.95
      }'



# Update Article in Storage


curl -X POST http://127.0.0.1:8090/api/v1/storage/ \
  -H 'Content-Type: application/json' \
  -d '{
        "name": "Superhammer",
        "amount": 111,
        "articleNumber": 1234,
        "price": 19.95
      }'
