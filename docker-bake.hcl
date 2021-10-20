group "release" {
    targets = [
        "3.8-release",
        "3.9-release",
        "3.10-release",
    ]
}

group "default" {
    targets = ["3.8","3.9","3.10"]
}

target "3.8" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "8"}
    tags = [
        "cyb3rjak3/alpine-pandas:3.8",
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.8",
        "registry.gitlab.com/cyb3r-jak3/alpine-pandas:3.8",
    ]
}

target "3.9" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "9"}
    tags = [
        "cyb3rjak3/alpine-pandas:3.9",
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.9",
        "registry.gitlab.com/cyb3r-jak3/alpine-pandas:3.9",
    ]
}

target "3.10" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "10"}
    tags = [
        "cyb3rjak3/alpine-pandas:3.10",
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.10",
        "registry.gitlab.com/cyb3r-jak3/alpine-pandas:3.10",
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.10-cache",
    ]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/alpine-pandas:3.10-cache",
    ]
} 

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/arm/v7",
        "linux/arm/v6",
        "linux/386"
    ]
}

target "3.8-release" {
    inherits = ["docker-metadata-action", "3.8"]
    cache-from = [
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.8-cache",
    ]
    cache-to=[
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/alpine-pandas:3.8-cache"
        ]
}

target "3.9-release" {
    inherits = ["docker-metadata-action", "3.9"]
    cache-from = [
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.9-cache",
    ]
    cache-to=[
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/alpine-pandas:3.9-cache",
        ]
}

target "3.10-release" {
    inherits = ["docker-metadata-action", "3.10"]
    cache-from = [
        "ghcr.io/cyb3r-jak3/alpine-pandas:3.10-cache",
    ]
    cache-to=[
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/alpine-pandas:3.10-cache",
        ]
}