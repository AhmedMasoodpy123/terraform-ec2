variable "region" {
  default = "eu-west-2"
}

variable "ami_id" {
  type = map(string)

  default = {
    eu-west-2    = "ami-09a2a0f7d2db8baca"
    eu-central-1 = "ami-9787h5h6nsn"
  }
}
