#Technical test project#5

Technical test for emnify:

# Challenges EMnify

## Question: Deploying on K8s [here](question1/README.md)

A user has written a YAML file containing a Kubernetes `Deployment` resource and applies it using `kubectl apply`. 

Please describe in as much detail as you can what happens underneath on the machine executing the command, within the cluster and on the network?

## Coding Challenge: Deploying on AWS [here](coding_challenge/README.md)

Please provide infrastructure code to deploy a recursive DNS resolver on AWS.

Submit a link your solution or an invite to your private GitHub repo for user `stephenking`.

The provided code should be easily applicaple against an own AWS account using the provided instructions.

### DNS Resolver [here](dns_resolver/README.md)

Deploy one or multiple recursive DNS resolvers on AWS. The resolvers should forward queries to Amazon's DNS service, if they don't have the answer in their cache.
These DNS resolvers should not be reachable from the public internet, but only from all instances in the AWS VPC. Imagine that these DNS resolvers might later apply filtering for which host names can be resolved and thus provide functionality beyond AWS' integrated Route53 resolver.

If you choose to install a web interface for monitoring the DNS resolver software, a link to the web interface should be provided to the user.

### Test Instance [here](test_instance/README.md)

Deploy a test instance that uses your DNS resolver and into which one can log in for testing. Please provide a short description, how you verified that your resolver is really used.

### Discussion [here](discussion/README.md)

Briefly discuss, where the setup can/should be extended to achieve production-grade security, high availability end reliable updates of the DNS server software.
