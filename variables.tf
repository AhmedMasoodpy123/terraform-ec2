variable "region" {
  default = "eu-west-2"
}

variable "ami_id" {
  type = map(string)

  default = {
    eu-west-2    = "ami-0f98541a3c898423d"
    eu-central-1 = "ami-9787h5h6nsn"
  }
}
