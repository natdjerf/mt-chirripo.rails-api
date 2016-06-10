Mount Chirripo front end: https://github.com/natdjerf/mt-chirripo.ember-auth



### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```


### RESERVATIONS

| Verb       | URI Pattern            | Controller#Action        |
|------------|------------------------|--------------------------|
| POST       | `/reservations`        | `reservations#create`    |
| GET        | `/reservations`        | `reservations#show`      |
| PATCH/PUT  | `/reservations/:id`    | `reservations#update`    |
| DELETE     | `/reservations/:id`    | `reservations#destroy`   |

#### POST /reservations

Request:

```sh
curl --include --request POST http://localhost:3000/reservations/ \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
  "reservation": {
    "id": 18,
    "permit_quantity": 1,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-24",
    "permit_end_date": "2016-06-24",
    "total_cost": 53
  }
}'
```

```sh
scripts/reservation-post.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "reservation": {
    "id": 17,
    "permit_quantity": 1,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-28",
    "permit_end_date": "2016-06-28",
    "total_cost": 15
  }
}
```

#### PATCH /reservations/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/reservations/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
  "reservation": {
    "id": 18,
    "permit_quantity": 1,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-24",
    "permit_end_date": "2016-06-24",
    "total_cost": 53
  }
}'

```

```sh
ID=<id> TOKEN=<token> scripts/reservations-patch.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "reservation": {
    "id": 3,
    "permit_quantity": 3,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-28",
    "permit_end_date": "2016-06-28",
    "total_cost": 45
  }
}
```

#### DELETE /reservations/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/reservations/$ID \
  --header "Authorization: Token token=$TOKEN"
```

Response:

```md
HTTP/1.1 204 No Content
```

#### GET /reservations

Request:

```sh
curl --include --request GET http://localhost:3000/reservations \
  --header "Authorization: Token token=$TOKEN"
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "reservations": [
    {
      "id": 16,
      "permit_quantity": 2,
      "lodging_quantity": 2,
      "permit_start_date": "2016-06-01",
      "permit_end_date": "2016-06-03",
      "total_cost": 230
    }
  ]
}

{
  "reservation": {
    "id": 3,
    "permit_quantity": 3,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-28",
    "permit_end_date": "2016-06-28",
    "total_cost": 45
  }
}
```

#### GET /reservations/:id

Request:

```sh
curl --include --request GET http://localhost:3000/reservations/$ID \
  --header "Authorization: Token token=$TOKEN"
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "reservation": {
    "id": 3,
    "permit_quantity": 3,
    "lodging_quantity": 1,
    "permit_start_date": "2016-06-28",
    "permit_end_date": "2016-06-28",
    "total_cost": 45
  }
}
```
