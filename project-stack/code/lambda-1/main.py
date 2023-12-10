# lambda code to print hello world
import json

def lambda_handler(event, context):
    print("Hello World")
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
