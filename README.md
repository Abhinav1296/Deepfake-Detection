powershell -Command "@'
---
title: Deepfake Detection
emoji: 🎭
colorFrom: red
colorTo: purple
sdk: docker
app_port: 7860
pinned: false
license: mit
---

# TriGuard-DF: Deepfake Detection

A multi-modal deepfake detection system using:
- Spatial Branch: EfficientNet-B0 for facial features
- Frequency Branch: FFT-based artifact detection
- Physiological Branch: rPPG heart-rate signal analysis

## How to Use

1. Wait for the model to load
2. Upload a video file (.mp4, .avi, .mov) - max 100 MB
3. Get REAL / FAKE prediction with confidence score

## Endpoints

- GET / - Web UI
- GET /health - Model status
- POST /predict - Single video prediction
- POST /batch/start - Batch job

## Note

CPU inference takes 60-120 seconds per video on free tier hardware.
'@ | Out-File -FilePath README.md -Encoding utf8"