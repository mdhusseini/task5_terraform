data "aws_iam_policy_document" "assume_policy" {
  statement {
	  actions   = ["sts:AssumeRole"]
	  principals {
		  type        = "Service"
		  identifiers = ["ec2.amazonaws.com"]
		}
	}
}

data "aws_iam_policy_document" "role_inline_policy" {
  statement {
	  actions   = ["kms:Decrypt"]
	  resources  = [aws_kms_key.test-devops-kms-key-dev-eu-west-1.arn]
	}
  statement {
		actions = [
			"dynamodb:PutItem",
			"dynamodb:GetItem",
			"dynamodb:GetRecords"
		]
		resources = [
			aws_dynamodb_table.test-devops-dynamodb-dev-eu-west-1.arn,
			aws_dynamodb_table.test-devops-dynamodb-dev-eu-west-1.stream_arn
		]
	}
}