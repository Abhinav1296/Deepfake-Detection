FROM python:3.10-slim

# Install system dependencies (OpenCV + MediaPipe need these)
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first (Docker layer caching)
COPY requirements.txt .

# Install Python dependencies (CPU-only torch to save space)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Create runtime folders
RUN mkdir -p output/uploads output/logs

# HF Spaces uses port 7860
EXPOSE 7860
ENV PORT=7860

# Run the Flask app
CMD ["python", "app.py"]