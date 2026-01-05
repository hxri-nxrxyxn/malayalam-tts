#!/bin/bash

# Base URL for Malayalam Arjun Medium
BASE_URL_ARJUN="https://huggingface.co/rhasspy/piper-voices/resolve/main/ml/ml_IN/arjun/medium"
# Base URL for Malayalam Meera Medium
BASE_URL_MEERA="https://huggingface.co/rhasspy/piper-voices/resolve/main/ml/ml_IN/meera/medium"

echo "Downloading Malayalam Arjun models..."
wget -O models/ml_IN-arjun-medium.onnx "${BASE_URL_ARJUN}/ml_IN-arjun-medium.onnx"
wget -O models/ml_IN-arjun-medium.onnx.json "${BASE_URL_ARJUN}/ml_IN-arjun-medium.onnx.json"

echo "Downloading Malayalam Meera models..."
wget -O models/ml_IN-meera-medium.onnx "${BASE_URL_MEERA}/ml_IN-meera-medium.onnx"
wget -O models/ml_IN-meera-medium.onnx.json "${BASE_URL_MEERA}/ml_IN-meera-medium.onnx.json"


echo "Download complete. Files are in the 'models' directory."
