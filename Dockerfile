FROM ubuntu:22.04

# upgrade and install ffmpeg
RUN apt update \
 && apt -y upgrade \
 && apt -y install linux-headers-oem-22.04 linux-modules-extra-6.8.0-40-generic curl \
 && curl -LO https://repo.radeon.com/amdgpu-install/6.2/ubuntu/jammy/amdgpu-install_6.2.60200-1_all.deb \
 && apt -y install ./amdgpu-install_6.2.60200-1_all.deb \
 && apt update \
 && apt -y install amdgpu-dkms rocm \
 && apt -y install ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# install whisper requirements
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.1 \
 && pip install datasets ipywidgets transformers numba openai-whisper --no-input \ 
 && pip cache purge 

# cache models
COPY ./build/* /build/
RUN python3 /build/download.py


