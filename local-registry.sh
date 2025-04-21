#podman run -d -p 5000:5000 --name local-registry docker.io/library/registry:2
podman run -d -p 0.0.0.0:5000:5000 --replace --name local-registry docker.io/library/registry:2
