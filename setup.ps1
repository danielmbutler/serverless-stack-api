aws cognito-idp sign-up --region us-east-1 --client-id 7rqokfv7nklg5tsoopqafsqeus --username admin@example.com --password Passw0rd!
aws cognito-idp admin-confirm-sign-up --region us-east-1 --user-pool-id us-east-1_Yu1lAFBKD --username admin@example.com

npm install serverless -g
serverless install --url https://github.com/AnomalyInnovations/serverless-nodejs-starter --name notes-api

npm install --save-dev serverless-bundle

mkdir mocks
npm i -D serverless-dotenv-plugin

serverless invoke local --function create --path mocks/create-event.json

<#Serverless: DOTENV: Loading environment variables from .env:
Serverless: 	 - tableName
Serverless: Bundling with Webpack...
{
    "statusCode": 200,
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    },
    "body": "{\"userId\":\"USER-SUB-1234\",\"noteId\":\"53ebb450-1bc7-11eb-862b-a5831343ac97\",\"content\":\"hello world\",\"attachment\":\"hello.jpg\",\"createdAt\":1604182848533}" #>

serverless invoke local --function get --path mocks/get-event.json

<# Serverless: DOTENV: Loading environment variables from .env:
Serverless: 	 - tableName
Serverless: Bundling with Webpack...
{
    "statusCode": 200,
    "body": "{\"attachment\":\"hello.jpg\",\"content\":\"hello world\",\"createdAt\":1604182848533,\"noteId\":\"53ebb450-1bc7-11eb-862b-a5831343ac97\",\"userId\":\"USER-SUB-1234\"}",
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    }
} #>

serverless invoke local --function list --path mocks/list-event.json

<# {
    "statusCode": 200,
    "body": "[{\"attachment\":\"hello.jpg\",\"content\":\"hello world\",\"createdAt\":1604182848533,\"noteId\":\"53ebb450-1bc7-11eb-862b-a5831343ac97\",\"userId\":\"USER-SUB-1234\"}]",
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    }
}#>

serverless invoke local --function update --path mocks/update-event.json

<#{
    "statusCode": 200,
    "body": "{\"status\":true}",
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    }
} #>


serverless invoke local --function delete --path mocks/delete-event.json

<#{
    "statusCode": 200,
    "body": "{\"status\":true}",
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    }
}
#>

npm install --save stripe

serverless invoke local --function billing --path mocks/billing-event.json

<#{
    "statusCode": 200,
    "body": "{\"status\":true}",
    "headers": {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true
    }
}#>

npm install --save-dev jest

del handler.js
del tests/handler.test.js

npm test

<#
npm : PASS tests/billing.test.js
At line:1 char:1
+ npm test
+ ~~~~~~~~
    + CategoryInfo          : NotSpecified: (PASS tests/billing.test.js:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
  âˆš Lowest tier (3ms)
  âˆš Middle tier (1ms)
  âˆš Highest tier
Test Suites: 1 passed, 1 total
Tests:       3 passed, 3 total
Snapshots:   0 total
Time:        6.038s
Ran all test suites. #>

mkdir resources

serverless deploy

<#
Serverless: Stack update finished...
Service Information
service: notes-api
stage: prod
region: us-east-1
stack: notes-api-prod
resources: 43
api keys:
  None
endpoints:

functions:
  create: notes-api-prod-create
  get: notes-api-prod-get
  list: notes-api-prod-list
  update: notes-api-prod-update
  delete: notes-api-prod-delete
  billing: notes-api-prod-billing
layers:
  None
Serverless: Run the "serverless" command to setup monitoring, troubleshooting and testing.
#>