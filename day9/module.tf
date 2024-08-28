module "dev" {
    source = "../day-2"
    ami_id = "ami-0a4408457f9a03be3"
    instance_type ="t2.micro"
    key_name ="linux" 
    
}