# Prerequisites

- Enable experimental features
- Install latest buildx, chmod a+x ~/.docker/cli-plugins/docker-buildx
- Login to docker hub

# Build image QEMU

- docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
- docker buildx create --use --name=qemu
- docker buildx inspect --bootstrap
- docker buildx build --push -t mikhailmerkulov/dotnetarmtest:latest --platform=linux/amd64,linux/arm64 --progress plain .

# Build image cross-compilation

- docker buildx create --use --name=cross
- docker buildx inspect --bootstrap cross
- docker buildx build -f Dockerfile.cross --push -t mikhailmerkulov/dotnetarmtest:cross --platform=linux/amd64,linux/arm64 --progress plain .
