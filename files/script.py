import torch

print(f"number of GPUs: {torch.cuda.device_count()}")
print([torch.cuda.get_device_name(i) for i in range(torch.cuda.device_count())])

from transformers import pipeline

#device = "cuda:0" if torch.cuda.is_available() else "cpu"
device = "cuda:0" if torch.cuda.is_available() else exit(1)

print("Device: ", torch.cuda.get_device_name(device))
print("Capabilities: ", torch.cuda.get_device_properties(device))

pipe = pipeline(
  "automatic-speech-recognition",
  model="openai/whisper-medium",
  chunk_length_s=30,
  device=device,
)

transcription = pipe("/mnt/audio.mp3")['text']
print(transcription)

