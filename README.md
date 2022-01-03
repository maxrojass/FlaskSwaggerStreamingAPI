<!-- GETTING STARTED -->
## The Project

This is a project to create a scalable HTTP api that writes raw data to
a data lake in AWS S3 using also the services EC2 and Kinesis Firehose to track which features are being used by each
user in order to understand what drives retention. the code includes:
- Docker
- Swagger
- Terraform
- Ansible
- Flask

### Pre Requisits

You have to install brew, Python, Docker and Terraform before hand.
Brew:
   ```sh
   /bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)' -y

   ```
Terraform:
   ```sh
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```
Python
   ```sh
    pip install python
   ```
### Installation
1. Mount Docker with Terraform
   ```sh
    open -a Docker
    mkdir learn-terraform-docker-container
    cd learn-terraform-docker-container
    create main.tf with specs
    terraform init
   ```
2. install AWS CLI
   ```sh
    docker run --rm -it amazon/aws-cli --version
   ```
_To run any command with AWS CLI use -------> docker run --rm -it amazon/aws-cli --COMMAND--_

3. Confiugre AWS CLI
    ```sh
    docker run --rm -it amazon/aws-cli configure  
    ```
4. Write AWS Configuration
    ```sh
    mkdir learn-terraform-aws-instance
    cd learn-terraform-aws-instance
    touch main.tf
    ```
5. Initialize the directory
    ```sh
    terraform init
    ```
6. Format and validate the configuration
    ```sh
    terraform fmt
    terraform validate
    ```
7. Create the infrastructure
    ```sh
    terraform apply
    ```
    _If the credentials don't work, run the code below_
    ```sh
    Export AWS_ACCESS_KEY_ID="ACCESS_KE_ID"
    export AWS_SECRET_ACCESS_KEY="SECRET_ACCESS_KEY" 
    export AWS_DEFAULT_REGION="REGION"
    ```
8. Create a .pem key file and move it to ./flask_api/terraform-docker-container/terraform-aws-instance/aws/

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

After running the installation, the infrastructure with the API should be installed and ready to start streaming data. in order to see the API you should go to http://EC2_public_ip_address:port/api/docs#/ 


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Maximiliano Rojas-Delgado - [LinkedIn](https://www.linkedin.com/in/maximiliano-rojas-delgado/) - maxrojasdel94@gmail.com

Project Link: [https://github.com/maxrojass/FlaskSwaggerStreamingAPI](https://github.com/maxrojass/FlaskSwaggerStreamingAPI)

<p align="right">(<a href="#top">back to top</a>)</p>

