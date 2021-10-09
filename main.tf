resource "aws_instance" "jenkins" {
  ami           = "ami-087c17d1fe0178315" 
  instance_type = "t2.micro" 
  subnet_id = var.subnet_id
  security_groups =[var.security_group_id]
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