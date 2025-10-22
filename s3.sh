# set region variable
REGION=ap-south-1
BUCKET_NAME=my-terraform-state-<your-unique-suffix>
DDB_TABLE=terraform-locks

# create S3 bucket (for ap-south-1 must set --create-bucket-configuration)
aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region $REGION \
  --create-bucket-configuration LocationConstraint=$REGION

# enable versioning (recommended)
aws s3api put-bucket-versioning --bucket $BUCKET_NAME \
  --versioning-configuration Status=Enabled

# enable encryption by default (SSE-S3)
aws s3api put-bucket-encryption --bucket $BUCKET_NAME \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# create DynamoDB table for locks
aws dynamodb create-table \
  --table-name $DDB_TABLE \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region $REGION
