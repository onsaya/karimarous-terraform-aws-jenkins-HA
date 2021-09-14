resource "aws_instance" "jenkins" {
  ami           = "ami-087c17d1fe0178315" 
  instance_type = "t2.micro" 
  subnet_id = "subnet-0d35d5878cabd2003"
  security_groups =["sg-057f04b5dab22d588"]
  credit_specification {
    cpu_credits = "unlimited"
  }
 
}