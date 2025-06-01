resource "aws_iam_openid_connect_provider" "oidc-git" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com"
  ]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
  tags = {
    IAC = "True"
  }
}

resource "aws_iam_role" "tf-role" {
  name = "tf-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = aws_iam_openid_connect_provider.oidc-git.arn
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:ElizaAugusta4/terraform-pipeline-project:ref:refs/heads/master"
          }
        }
      }
    ]
  })

  inline_policy {
    name = "tf-permission"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid      = "Statement1"
          Action   = "ecr:*"
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Sid      = "Statement2"
          Action   = "iam:*"
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Sid      = "Statement3"
          Action   = "s3:*"
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
  tags = {
    IAC = "True"
  }
}