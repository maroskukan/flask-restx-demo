# Flask Web Forms

Demo of running [Flask-RESTX](https://flask-restx.readthedocs.io/en/latest/) application inside a Docker container.

## How to build this image

Build and tag the image pointing context to current working directory. 

```bash
docker build -t maroskukan/restx:latest .
```

## How to run this image

Verify that application works by running a container from image.

```bash
docker container run -it --rm -p 5000:5000 maroskukan/restx:latest
```