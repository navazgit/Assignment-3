resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "462281-DynamoDB"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "UserId"
  
  
  attribute {
    name = "UserId"
    type = ""
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "462281_iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function_payload.zip"
  function_name    = "lambda_function_name"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "exports.test"
  source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  runtime          = "nodejs4.3"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

