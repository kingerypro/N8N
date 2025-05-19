# 🎬 N8N YouTube Short Generator (Offline + Auto Upload)

This is a fully offline-first automated workflow using **n8n** to generate and publish YouTube Shorts using AI, TTS, and local tools — no OpenAI, no subscriptions, no BS.

---

## 🚀 Features

- 🧠 Converts AI prompts into flowing dialogue with natural emotion  
- 🗣️ Uses **Edge TTS** locally for high-quality voice clips  
- 🖼️ Pulls relevant images from **Pexels API**  
- 🎞️ Stitches video using **FFmpeg** (local install)  
- 💾 Converts to binary and uploads via **YouTube Data API**  
- 🧹 Auto-cleans temp folders after every run  
- ⏰ Runs manually or on a schedule (every 80 minutes by default)

---

## 🛠️ Start Here

Run this first:
```bash
auto_setup.bat
```
✅ This checks that your Python and FFmpeg environment is set up properly before the automation runs.

---

## 📦 Python Dependencies

```bash
pip install edge-tts
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
pip install requests


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
