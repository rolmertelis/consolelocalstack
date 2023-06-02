#!/bin/bash
aws --endpoint-url=http://localhost:4566 secretsmanager --region sa-east-1 create-secret --name secret-teste-2 --secret-string '{"uk-contracts-2":"api_key_value-2"}'

