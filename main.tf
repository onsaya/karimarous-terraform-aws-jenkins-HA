resource "aws_instance" "jenkins" {
  ami           = "ami-087c17d1fe0178315" 
  instance_type = "t2.micro" 
  subnet_id = "subnet-0d35d5878cabd2003"
  security_groups =["sg-057f04b5dab22d588"]
  key_name = "EC2"
  credit_specification {
    cpu_credits = "unlimited"
  }
  user_data=<<EOF
    #! /bin/bash
    sudo yum update –y
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum upgrade
    sudo amazon-linux-extras install epel -y
    sudo yum install jenkins java-1.8.0-openjdk-devel -y
    sudo systemctl daemon-reload
    sudo systemctl start jenkins
    sudo systemctl status jenkins
  EOF
}