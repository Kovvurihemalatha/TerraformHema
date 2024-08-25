terraform {
  backend "s3" {
    bucket = "hemaws"
    key    = "linux/terraform.tfstate"
    region = "ap-south-1"
  }
}