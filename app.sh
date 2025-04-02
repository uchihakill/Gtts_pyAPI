#!/bin/bash

cd "$(dirname "$0")"

# Run the script in a new terminal window
gnome-terminal -- bash -c "
    echo 'Activating virtual environment...';
    source env/bin/activate;
    echo 'Installing Flask and gTTS...';
    pip install -r requirements.txt;
    echo 'Starting the gTTS Flask API...';
    python gtts-v1.py;
    exec bash"

