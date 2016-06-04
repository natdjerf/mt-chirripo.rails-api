#!/bin/bash

curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --header \
  --data '{
    "reservations": {
      "permit_quantity" : ,
      "lodging_quantity" : ,
      "permit_start_date" : ,
      "permit_end_date": ,
      "total_cost":
    }
  }'
