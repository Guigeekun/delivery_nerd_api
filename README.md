# delivery_nerd_api
I dunno we're just trying stuff, that's the api btw


This stuff works with [Django](https://www.djangoproject.com/) go check it out
# Run with docker-compose

Install docker-compose, you're a grown ass dude you should figure it out

Create docker-compose.yaml at the parent folder

```docker
version: '3.7'
services:

  nerd_db:
    image: postgres
    container_name: nerd_db
    volumes:
      - nerd_db:/var/lib/postgresql/data
    ports:
      - 5433:5433
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: nerd_db

  nerd_api:
    build: ./delivery_nerd_api
    container_name: nerd_api
    command: python manage.py runserver 0.0.0.0:8000
    ports:
      - 8000:8000
    volumes:
      - ./delivery_nerd_api:/app
    depends_on:
      - nerd_db
    links:
      - nerd_db
volumes:
  nerd_db:
```

then run it
```
docker-compose up
```

yay