#!/bin/bash

curl --include --request POST http://localhost:3000/reservations \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=BAhJIiU4Mjk3ODYzYmU1ZmIxNzU3NWVhZTdlYThlYjI5NTc5OAY6BkVG--4ead656b56c6534ebe3aebd6fedaaf90d00dbdcc" \
  --data '{
    "reservations": {
      "permit_quantity" : 1,
      "lodging_quantity" : 1,
      "permit_start_date" : "2016-06-25",
      "permit_end_date": "2016-06-25",
      "total_cost": 53
    }
  }'
