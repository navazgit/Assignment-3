resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "462281-DynamoDB"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "UserId"
  range_key      = "462281"
  
  attribute {
    name = "UserId"
    type = "S"
  }
}