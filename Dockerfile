# Use a working image containing piper
FROM ghcr.io/matatonic/openedai-speech-min:latest

# Set working directory
WORKDIR /app

# Copy models from your host to the container
COPY models/ /app/models/

# Set the entrypoint to piper
# This allows you to pass text via stdin
ENTRYPOINT ["/usr/local/bin/piper", "--model", "/app/models/ml_IN-meera-medium.onnx"]
