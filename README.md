This terraform template shows an example of how to use the file and
remote-exec provisioners. This template also uses the aws_key_pair resource
to upload and label the public key of the node running terraform to AWS
(this will enable the SSH connection needed to subsequently run the
aforementioned provisioners on the newly-formed instanced).

Other ways to configure a node include using Packer to prepare the image
before deployment (see https://github.com/Omar-Khawaja/ansible_jenkins_centos7
for an example) and some other methods methods listed in Terraform's official
documentation (see https://www.terraform.io/docs/provisioners/index.html)

