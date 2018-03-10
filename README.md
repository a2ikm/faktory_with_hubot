# Faktory with Hubot

Run hubot, faktory and its worker with docker-compose.

```
cp hubot/.env.sample hubot/.env
vi hubot/.env

cp worker/.env.sample worker/.env
vi worker.env

docker-compose up --build
```

And show faktory's dashboad.

```
open http://localhost:7420
```
