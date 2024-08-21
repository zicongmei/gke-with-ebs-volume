resource "aws_ebs_volume" "ebs" {
  availability_zone = var.aws-zone
  size              = 40

  tags = {
    Name = "${var.name}-ebs"
  }
}



resource "aws_iam_role" "ebs-role" {
  name = "${var.name}-ebs-role"


  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.eks_issuer}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "${local.eks_issuer}:aud": "sts.amazonaws.com",
                    "${local.eks_issuer}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
                }
            }
        }
    ]
}
POLICY
}

