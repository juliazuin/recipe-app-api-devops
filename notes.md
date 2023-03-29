### Setup local
Para rodar o docker-compose.yaml é necessario realizar login com o aws vault

```sh
aws-vault exec {profile_name}
```

Após isso no mesmo terminal digite
````sh
docker compose -f deploy/docker-compose.yml run terraform init 
````
