# Conectar PostgreSQl y pg Admin
crear base de datos en docker
```
docker run --name my-postgres -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -p 5432:5432 -d postgres:9.5.5
```