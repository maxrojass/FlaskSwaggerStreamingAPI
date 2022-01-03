
provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

#aws instance creation
resource "aws_instance" "FlaskSwagger" {
  ami           = "ami-05803413c51f242b7"
  instance_type = "t2.micro"
  key_name = "test"
  security_groups = [ "full_access" ]
  tags = {
    Name = "FlaskSwagger"
  }
  connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = "${file("./flask_api/terraform-docker-container/terraform-aws-instance/aws/key.pem")}"
  host        = "${self.public_ip}"
  }
  
  provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "sudo amazon-linux-extras install ansible2 -y",
    "sudo yum install git -y",
    "sudo apt-get install python -y",
    "git clone https://github.com/devops-school/ansible-hello-world-role",
    "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)' -y",
    "$ brew tap hashicorp/tap -y",
    "brew install hashicorp/tap/terraform -y",
    "brew update -y",
    "cd /root/flask_api/ansible/",
	  "ansible-playbook playbook.yml"
  ]
  }
}



