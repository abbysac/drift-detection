resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket-drift-detection"
}

<<<<<<< HEAD
resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowGitHubActionsOIDCRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::224761220970:role/github-actions-oidc-role"
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:GetBucketPolicy"
        ]
        Resource = [
          "arn:aws:s3:::my-example-bucket-drift-detection",
          "arn:aws:s3:::my-example-bucket-drift-detection/*"
        ]
      }
    ]
  })
}

=======
>>>>>>> 4560fc03478a7107d9e4182dfe37cdc15cde97cc
# data "aws_iam_openid_connect_provider" "github" {
#   url = "https://token.actions.githubusercontent.com"

#   client_id_list = [
#     "sts.amazonaws.com"
#   ]

#   thumbprint_list = [
#     "74f3a68f16524f15424927704c9506f55a9316bd"
#   ]
# }

resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-oidc-role"

  assume_role_policy = jsonencode({
<<<<<<< HEAD
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          "Federated" : "arn:aws:iam::224761220970:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = [
          "sts:AssumeRoleWithWebIdentity",
          "sts:TagSession"
        ],
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" : "repo:abbysac@79344520/drift-detection@1307247485:ref:refs/heads/main"
=======
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::224761220970:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" = "repo:abbysac/drift-detection:ref:refs/heads/main"

>>>>>>> 4560fc03478a7107d9e4182dfe37cdc15cde97cc
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_actions_policy" {
  name        = "github-actions-policy"
  description = "Permissions for GitHub Actions OIDC role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sts:AssumeRole",
<<<<<<< HEAD
          "sts:AssumeRoleWithWebIdentity",
          "iam:GetRole",
          "iam:GetPolicy",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:GetPolicyVersion"
=======
          "sts:AssumeRoleWithWebIdentity"
>>>>>>> 4560fc03478a7107d9e4182dfe37cdc15cde97cc
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github_actions_attach" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.github_actions_policy.arn
}
<<<<<<< HEAD

resource "aws_iam_policy" "s3_policy" {
  name        = "s3-policy"
  description = "Permissions for GitHub Actions OIDC role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketPolicy",
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketWebsite",
          "s3:GetBucketVersioning",
          "s3:GetAccelerateConfiguration",
          "s3:GetBucketRequestPayment",
          "s3:GetBucketLogging",
          "s3:GetLifecycleConfiguration",
          "s3:GetReplicationConfiguration",
          "s3:GetEncryptionConfiguration",
          "s3:GetBucketObjectLockConfiguration",
          "s3:GetBucketTagging"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github_s3_attach" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
=======
>>>>>>> 4560fc03478a7107d9e4182dfe37cdc15cde97cc
