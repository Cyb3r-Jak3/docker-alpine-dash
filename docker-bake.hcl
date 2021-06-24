variable "DOCKER_META_VERSION" {
    default = "v0.0.0"
}

group "release" {
    targets = [
        "3.6-release",
        "3.7-release",
        "3.8-release",
        "3.9-release",
    ]
}

group "all" {
    targets = ["3.6","3.7","3.8","3.9"]
}


target "3.6" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "6"}
    tags = [
        "cyb3rjak3/alpine-dash:3.6",
        "ghcr.io/cyb3r-jak3/alpine-dash:3.6",
        "registry.gitlab.com/cyb3r-jak3/alpine:3.6",
    ]

}

target "3.7" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "7"}
    tags = [
        "cyb3rjak3/alpine-dash:3.7",
        "ghcr.io/cyb3r-jak3/alpine-dash:3.7",
        "registry.gitlab.com/cyb3r-jak3/alpine:3.7",
    ]
}

target "3.8" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "8"}
    tags = [
        "cyb3rjak3/alpine-dash:3.8",
        "ghcr.io/cyb3r-jak3/alpine-dash:3.8",
        "registry.gitlab.com/cyb3r-jak3/alpine:3.8",
    ]
}

target "3.9" {
    dockerfile = "Dockerfile"
    args = {"PYTHON_MINOR_VERSION" = "9"}
    tags = [
        "cyb3rjak3/alpine-dash:3.9",
        "ghcr.io/cyb3r-jak3/alpine-dash:3.9",
        "registry.gitlab.com/cyb3r-jak3/alpine:3.9",
    ]
} 

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm/v6",
        "linux/arm/v7",
        "linux/arm64",
        "linux/386",
    ]

    // cache-to=["/tmp/.buildx-cache-new"]
    cache-from=["/tmp/.buildx-cache"]
}

target "3.6-release" {
    inherits = ["3.6", "docker-metadata-action"]
}

target "3.7-release" {
    inherits = ["3.7", "docker-metadata-action"]
}

target "3.8-release" {
    inherits = ["3.8", "docker-metadata-action"]
}

target "3.9-release" {
    inherits = ["3.9","docker-metadata-action"]
}
