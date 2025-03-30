variable "aws_region" {
  default = "ap-northeast-1"
}

variable "ami_id" {
  default = "ami-0934b0aeb9077301c"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  default = "my-key" # ここに正しいキーペア名を設定してください
}

variable "vpc_id" {
  default = "vpc-034e0b2df00a2d773"
}

variable "subnet_id" {
  default = "subnet-073dc338934225564"
}

variable "domain_name" {
  default = "masstech.com" # 独自ドメイン名を入力
}

variable "hosted_zone_id" {
  default = "Z06225443N3SVWKBCNMVF" # Route 53のホストゾーンIDを入力
}
