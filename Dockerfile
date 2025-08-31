# एक पूरी Python बेस इमेज का उपयोग करें
FROM python:3.10

# अपनी वर्किंग डायरेक्टरी सेट करें
WORKDIR /usr/src/app

# requirements.txt को कॉपी करें
COPY requirements.txt ./

# apt-get का उपयोग करके FFmpeg इंस्टॉल करें
RUN apt-get update -y && apt-get install -y ffmpeg

# निर्भरताएं इंस्टॉल करें
RUN pip install --no-cache-dir -r requirements.txt

# बाकी की सभी फ़ाइलों को कॉपी करें
COPY . .

# बॉट को शुरू करने के लिए कमांड
CMD ["python", "main.py"]
