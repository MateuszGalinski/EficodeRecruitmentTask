### Docker

I created a docker-compose file as well as dockerfiles for both frontend and backend. It can be run by using docker-compose up command after providing a API-key in backend app

#### Terraform

To create an ec2 instance for our app you have to provide your amazon user credential (access-key and secre-key in main file) and then write command terraform init and terraform apply

### Ansible

Currently for app to work properly on cloud there's a need to create ansible playbook that clones a git repository, installs docker and then runs docker-compose in vm
