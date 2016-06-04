#!/bin/bash
TOKEN=BAhJIiUxM2Q3NDVkODQ3MjUxMzk0OTg3MzQyNzkxMTYxMjQ1OQY6BkVG--2641d416701b4d92e951b3e2c34dd1d39c21a2c7
ID=18

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
