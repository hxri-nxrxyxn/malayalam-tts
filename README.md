# Malayalam TTS with Piper

This project provides a Dockerized setup for Malayalam Text-to-Speech (TTS) using [Piper](https://github.com/rhasspy/piper). It includes support for running as a CLI tool or as an OpenAI-compatible HTTP API server.

## Features
- **Voices**: Includes two high-quality Malayalam voices:
  - `arjun` (Male)
  - `meera` (Female)
- **Deployment**:
  - **CLI**: Generate audio files directly from the command line.
  - **Server**: Run an HTTP API compatible with the OpenAI Speech API.

## Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/hxri-nxrxyxn/malayalam-tts.git
    cd malayalam-tts
    ```

2.  **Download the voice models:**
    This script downloads the required `.onnx` models and config files for Arjun and Meera.
    ```bash
    bash get_voices.sh
    ```

## Usage

### Option 1: CLI (Command Line Interface)

Build the local Docker image:
```bash
docker build -t piper-malayalam .
```

Generate audio by piping text:

**Using Meera (Female):**
```bash
echo "നമസ്കാരം, സുഖമാണോ?" | docker run -i piper-malayalam --output_file - > output.wav
```

**Using Arjun (Male):**
To use Arjun, you need to override the model path (default is Meera in the Dockerfile):
```bash
echo "നമസ്കാരം, സുഖമാണോ?" | docker run -i --entrypoint /usr/local/bin/piper piper-malayalam --model /app/models/ml_IN-arjun-medium.onnx --output_file - > output_arjun.wav
```

### Option 2: API Server

Start the API server using Docker Compose:
```bash
docker-compose up -d
```

The server listens on port `8001`.

**Example `curl` command:**

```bash
curl http://localhost:8001/v1/audio/speech \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ml_IN-meera-medium",
    "input": "ഹായ്, എങ്ങനെയുണ്ട്?",
    "voice": "ml_IN-meera-medium"
  }' \
  --output speech.mp3
```

To use the **Arjun** voice via API:
Change `"model"` and `"voice"` to `"ml_IN-arjun-medium"`.

## Credits & Attribution

This project packages existing open-source work for easy deployment.

*   **Piper TTS Engine**: Developed by [Rhasspy](https://github.com/rhasspy/piper).
*   **Voices**:
    *   **Arjun (ml_IN-arjun-medium)**: Trained by the Rhasspy community. Available on [HuggingFace](https://huggingface.co/rhasspy/piper-voices).
    *   **Meera (ml_IN-meera-medium)**: Trained by the Rhasspy community. Available on [HuggingFace](https://huggingface.co/rhasspy/piper-voices).
*   **API Server**: Uses [openedai-speech](https://github.com/matatonic/openedai-speech) by [matatonic](https://github.com/matatonic).

## License
Please refer to the original licenses of the models and software used.
Piper is MIT licensed. Voice models often have their own specific licenses (usually open/creative commons).
