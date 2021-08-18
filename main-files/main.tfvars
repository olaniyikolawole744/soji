region                = "us-east-1"
profile               = "default"
ami_filter            = "packer-java-ami"
ssh_key               = "jenkins-kp"
instance_type         = "t2.micro"
resource_count        = 1
resource_tag_name     = "Tool (Ansible) Server"
resource_environment  = "Project Env"
resource_role         = "Devops-user"
module_instance_count = 3
module_tag_name       = ["Jenkins server", "Dev-App server", "Prod-App server"]
module_environment    = ["Project Env", "Development Env", "Production Env"]
module_role           = "Ansible-user"
sg_name               = "App Project"
httpport              = "22"
httpport2             = "8080"
httpport3             = "0"
ingress_protocol      = "tcp"
egress_protocol       = "-1"
sg_cidr_block         = ["0.0.0.0/0"]
vpc_name              = "App_Vpc"
#vpc_id = "aws_vpc.app_vpc.id"
vpc_id                 = ""
network_instance_count = 3
vpc_cidr_block         = "10.0.0.0/16"
subnet_cidr_block      = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
availability_zone      = ["us-east-1a", "us-east-1b", "us-east-1a"]
map_public_ip          = "true"
rt_cidr_block          = "0.0.0.0/0"



    