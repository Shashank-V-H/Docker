# greet

A simple interactive Docker container written in Bash.
It greets the user by name using figlet.

This container is a first step into learning Docker.
More interesting containers are planned for the future.

---

## What this container does

* Prompts the user for their name
* Prints a large figlet greeting
* Displays a friendly message about the container

---

## Project Structure

```
.
├── Dockerfile
├── print-message.sh
└── README.md
```

---

## Shell Script (`print-message.sh`)

```bash
#!/bin/bash

echo "Welcome!"
read -p "Please enter your name: " name
echo

figlet "Hello $name"

echo "This container is a simple first attempt to learn Docker."
echo "More interesting containers are on their way, hang tight!"
echo "Thank you for using this container."
```

Make it executable:

```bash
chmod +x print-message.sh
```

---

## Dockerfile

```dockerfile
FROM ubuntu:latest

RUN apt-get update && apt-get install -y figlet

COPY print-message.sh /print-message.sh
RUN chmod +x /print-message.sh

CMD ["/print-message.sh"]
```

---

## Build the Docker image

From the project directory:

```bash
docker build -t greet .
```

---

## Run the container

Run it interactively (required for user input):

```bash
docker run -it greet
```

---

## List Docker images

To verify the image exists locally:

```bash
docker images
```

You should see something like:

```
REPOSITORY   TAG     IMAGE ID
greet        latest  <image-id>
```

---

## Configure Docker CLI (one-time setup)

Log in to Docker Hub:

```bash
docker login -u shashankvh # you have use your Username once you create you account in Docker-hub.
```

You can use a Docker Hub Personal Access Token instead of a password if preferred.

---

## Tag the image for Docker Hub

```bash
docker tag greet shashankvh/greet:latest
```

Verify:

```bash
docker images
```

---

## Push the image to Docker Hub

```bash
docker push shashankvh/greet:latest
```

Once pushed, the image is available at:

[https://hub.docker.com/r/shashankvh/greet](https://hub.docker.com/r/shashankvh/greet)

---

## Run directly from Docker Hub

Anyone can now run:

```bash
docker run -it shashankvh/greet
```

---

<!-- ## Notes & Learnings -->
<!---->
<!-- * Docker images are stored internally by Docker, not as files in the directory. -->
<!-- * Image naming matters for permissions: -->
<!---->
<!--   * Incorrect: `greet` -->
<!--   * Correct: `shashankvh/greet` -->
<!-- * `-it` is required for interactive containers. -->
<!-- * Avoid mixing `docker` and `sudo docker` to prevent authentication issues. -->
<!---->
<!-- --- -->
<!---->
<!-- ## Next Steps -->
<!---->
<!-- * Add versioned tags (`v1.0.0`) -->
<!-- * Optimize image size -->
<!-- * Improve ENTRYPOINT for more flexibility -->
<!-- * Set up CI/CD for automated builds -->

