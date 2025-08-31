# एक Python बेस इमेज का उपयोग करें
FROM python:3.10-slim

# अपनी वर्किंग डायरेक्टरी सेट करें
WORKDIR /usr/src/app

# requirements.txt को कॉपी करें और निर्भरताएं इंस्टॉल करें
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# apt-get का उपयोग करके FFmpeg इंस्टॉल करें
# अब यह काम करेगा क्योंकि हम एक ऐसे Docker image का उपयोग कर रहे हैं जो इसे सपोर्ट करता है
RUN apt-get update -y && apt-get install -y ffmpeg

# बाकी की सभी फ़ाइलों को कॉपी करें
COPY . .

# बॉट को शुरू करने के लिए कमांड
CMD ["python", "main.py"]
