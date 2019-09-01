Instructions to run this infrastucture:

1 install terraform and packer if you don't have them.
2 use your aws keys and region in your terminal, e.g. for linux:
    export AWS_ACCESS_KEY_ID="1'02341jhpñsdg"
    export AWS_SECRET_ACCESS_KEY="aaslñdj`p92ui84012ñohjs"
    export AWS_DEFAULT_REGION="eu-west-1"

3 go to dns_resolver folder first using a terminal shell, there in the folder "virtual\/machine"

execute the command
$ packer build instance.json

the script will run and expose the output of the ami generated, copy it and take it with you.

Terraform:

In the Coding_challenge folder go to the Terraform folder, there in the variables.tf file modify the variables that you need, if you want to make it easy just change the owner-ami with your id (it's where the previous generated ami is stored), the public_key_path (That you will use to connect to your virtual instances) and the packer-ami (the one you copied from packer).

Once everything in place, move to the terraform folder with a terminal shell and execute $ terraform init, $ terraform plan and $ terraform apply in this order.

Then when the command completes the actions, you will observe that three ips will appear: 1 the private IP of the dns-resolver server, it's public IP and the IP of the instance that is binded to it.

You can log with your private key with (linux)

$ ssh -i private-key ubuntu@ip <<- dnsserver
$ ssh -i private-key ec2-user@ip <<- instance

the users are generic, to prove that I did not use anyother trick than the config files provided in the folders.

You can test with dnsmasq or dig that the resolver is the dns-server for that vpc.
