## Image Debugging

- Get a shell in an existing image when the entrypoint command crashes
  - `docker run -it --entrypoint "/bin/sh" IMAGE`

## Building for Other Platforms

Build for x86:
`docker buildx build . --platform linux/amd64 -t IMAGE`
