# 🎬 N8N YouTube Short Generator (Offline + Auto Upload)

This is a fully offline-first automated workflow using **n8n** to generate and publish YouTube Shorts using AI, TTS, and local tools.

## 🚀 Features

- 🧠 Converts AI prompts into flowing dialogue with natural emotion
- 🗣️ Uses **Edge TTS** locally for high-quality voice clips
- 🖼️ Pulls relevant images from **Pexels API**
- 🎞️ Stitches video with **FFmpeg** (local install)
- 💾 Converts to binary and uploads with **YouTube Data API**
- 🧹 Cleans up temp files for a fresh run each time
- ⏰ Runs manually or on a schedule (every 80 minutes by default)

---

## 🔧 Requirements

- Python 3.9+
- FFmpeg + FFprobe (added to system PATH)
- Self-hosted n8n
- Google Cloud Project with YouTube Data API v3 enabled
- Pexels API key

---

## 📦 Install Python Libraries

```bash
pip install edge-tts
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
pip install requests
📁 Folder Structure
css
Copy
Edit
.n8n/
├── speak.py
├── stitch_scene.py
├── upload_to_youtube.py
├── convert_video_to_binary.py
├── check_exists.py
├── clean_scene.py
├── check_saved_audio.py
saved_audio/
saved_images/
binaryData/
🔐 YouTube API Setup
Go to: https://console.cloud.google.com

Enable YouTube Data API v3

Create OAuth 2.0 client credentials

Save client_secrets.json inside .n8n/

First run will generate token.pickle automatically

🖼️ Pexels API Setup
Go to: https://www.pexels.com/api/

Create an account and generate your API key

Open stitch_scene.py and replace:

python
Copy
Edit
PEXELS_API_KEY = "YOUR_KEY_HERE"
✅ How To Run
Use the Manual Trigger in n8n to test

Or activate the Schedule Trigger (runs every 80 minutes by default)

💡 Why This Rocks
Runs 100% local — no OpenAI, no subscriptions, no cloud cost

Auto-cleans after each run

Builds intelligent, human-sounding Shorts from rich dialogue

Easy to customize or extend for your own use case
