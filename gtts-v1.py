from flask import Flask, request, send_file, jsonify
from gtts import gTTS
import os

app = Flask(__name__)

@app.route('/synthesize', methods=['POST'])
def synthesize():
    # Ensure JSON was provided
    data = request.get_json(force=True)
    if not data or 'text' not in data or 'folder' not in data:
        return jsonify({'error': 'JSON payload must include both "text" and "folder" keys.'}), 400

    text = data['text']
    folder = data['folder']

    # Check if the folder exists; if not, try to create it.
    if not os.path.exists(folder):
        try:
            os.makedirs(folder)
        except Exception as e:
            return jsonify({'error': f"Could not create folder: {e}"}), 500

    # Define output file path (you might want to include more unique naming)
    output_file = os.path.join(folder, "output.mp3")

    try:
        # Create the speech using gTTS and save to file
        tts = gTTS(text=text, lang='en')
        tts.save(output_file)
    except Exception as e:
        return jsonify({'error': f"Failed to generate speech: {e}"}), 500

    # Return the file as an attachment
    return send_file(output_file, as_attachment=True)

if __name__ == '__main__':
    # Listen on all network interfaces on port 5000
    app.run(host='0.0.0.0', port=5000)

