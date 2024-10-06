# whisper-amdgpu

Docker container to use Whisper with AMD GPUs.

The build process will take some time and will create a huge container (over 50gb in my case).

The build/download.py script will be invoked during the build process to pre-cache the Whisper model.

The files/script.py will run Whisper to transcribe a file named files/audio.mp3

## PLEASE NOTE

You might need to adapt the `--device` options to your system check `ls -l /dev/dri/by-path` and `lspci` to identify your card correctly.

