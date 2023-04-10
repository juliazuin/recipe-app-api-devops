### Setup local
Para rodar o docker-compose.yaml é necessario realizar login com o aws vault

```sh
winpty aws-vault exec {profile_name} --duration=2h
```

Após isso no mesmo terminal digite
````sh
docker compose -f deploy/docker-compose.yml run --rm terraform init 
````
