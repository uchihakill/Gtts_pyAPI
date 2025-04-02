# Gtts_pyAPI
#### WARNING:the python environment in this repo made on linux mint so any other os it is recomanded to re make the env folder and use the requirements.txt do donload the require lib's
```markdown
# Gtts_pyAPI

**Gtts_pyAPI** is a lightweight RESTful API built with Flask that leverages [gTTS](https://github.com/pndurette/gTTS) (Google Text-to-Speech) to convert text into speech. This API is designed for easy integration into your Python applications, enabling you to add voice features without hassle.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Integrating with Your Python App](#integrating-with-your-python-app)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Text-to-Speech Conversion:** Convert any text to an MP3 audio file using Google TTS.
- **RESTful API:** Easily interact with the API via standard HTTP POST requests.
- **Customizable Output:** Specify output folder paths for generated audio files.
- **Simple Integration:** Use this API in your Python applications for notifications, voice-enabled apps, and more.

## Prerequisites

- **Python:** Version 3.9 or higher is required.
- **Git:** For cloning and version control.
- **Virtual Environment:** Recommended for dependency management.

## Installation

1. **Clone the Repository:**
   ```bash
   git clone [email protected]:uchihakill/Gtts_pyAPI.git
   cd Gtts_pyAPI
   ```

2. **Create and Activate a Virtual Environment:**
   ```bash
   python3 -m venv env
   source env/bin/activate
   ```

3. **Install Dependencies:**
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Run the API:**
   ```bash
   python gtts-v1.py
   ```
   The API will start on port 5000 by default.

## Usage

### API Endpoint

- **URL:** `http://<your-host>:5000/synthesize`
- **Method:** `POST`
- **Content-Type:** `application/json`

### JSON Payload Example

```json
{
  "text": "Hello, this is a sample text to speech conversion.",
  "folder": "/path/to/your/output/folder"
}
```

### Using cURL to Test

```bash
curl -X POST http://127.0.0.1:5000/synthesize \
     -H "Content-Type: application/json" \
     -d '{"text": "Hello, this is a test of the Gtts_pyAPI.", "folder": "/home/user/output"}' \
     --output output.mp3
```

The API will generate the audio file in the specified folder and return the MP3 file as a response.

## Integrating with Your Python App

You can integrate the Gtts_pyAPI with your Python application using the `requests` library. For example:

```python
import requests

# Define API endpoint and payload
url = "http://127.0.0.1:5000/synthesize"
payload = {
    "text": "This is a sample integration with Gtts_pyAPI.",
    "folder": "/home/user/output"
}

# Send POST request
response = requests.post(url, json=payload)

# Save the output audio file
if response.status_code == 200:
    with open("output.mp3", "wb") as f:
        f.write(response.content)
    print("Audio file saved as output.mp3")
else:
    print("Error:", response.text)
```

This snippet demonstrates how to send a request to the API and handle the response, making it easy to integrate text-to-speech functionality into your own projects.

## Project Structure

```
Gtts_pyAPI/
├── env/                  # Virtual environment directory (ignored by Git)
├── app.sh                # Shell script for setup and launching the API
├── gtts-v1.py            # Main Flask API script
├── README.md             # Project documentation (this file)
├── requirements.txt      # Python dependencies
├── test.sh               # Optional testing script
└── output_exampel.mp3    # Example output audio file
```

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. For major changes, please discuss them first via an issue to ensure they align with the project goals.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

*Happy coding! Enjoy integrating voice features into your applications with Gtts_pyAPI
