resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster"

  tags = local.common_tags


}

resource "aws_iam_policy" "task_execution_role_policy" {
  name        = "${local.prefix}-task-exec-role-policy"
  description = "Allow retrieving of images and adding to logs"

  path = "/"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
  })

}

resource "aws_iam_role" "task_execution_role" {
  name               = "${local.prefix}-task-exec-role"
  assume_role_policy = jsonencode("./templates/ec2/assume-role-policy.json")
}

resource "aws_iam_role_policy_attachment" "task_execution_role" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = aws_iam_policy.task_execution_role_policy.arn
}

resource "aws_iam_role" "app_iam_role" {
  name               = "${local.prefix}-api-task"
  assume_role_policy = jsonencode("./templates/ecs/assume-role-policy.json")

  tags = local.common_tags
}