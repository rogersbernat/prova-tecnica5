Instructions:

Still early instructions, testing:

To build the container:

$ Docker build -t [image]:[tag] .

example:

docker build -t dnsmasq:latest .

If executing in a docker host, it will resolve using the host dns, so we have to run the command to point to the dns of Amazon.

$ docker run --rm -dns=169.254.169.253  dnsmasq:latest

To list the Docker containers:
$docker ps -a

To stop a container

$docker stop "<container-id>"

to remove a container:
$docker rm "<container-id>"

To remove an image:
$docker rmi "<image-id>"