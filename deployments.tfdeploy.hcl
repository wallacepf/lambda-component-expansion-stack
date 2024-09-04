# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["demo-stacks"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::259193454194:role/tfc-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = "arn:aws:iam::259193454194:role/tfc-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

