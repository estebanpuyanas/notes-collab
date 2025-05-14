# Online Note Collaboration App

Small online notes collaboration project I created to familarize myself with the tech stack the company I am interning with this summer uses:

1. Phoenix (Elixir) for backend
2. React (TypeScript) for frontend
3. GraphQL & Postgres

## Important commands

Build and run docker containers:

```
cd backend
docker compose up -d --build
```

Shutdown and delete containers:

```
docker compose -f docker-compose.yaml down
```

Stop the containers (no delete):

```
docker compose -f docker-compse.yaml stop
```
