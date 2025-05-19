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

```
auto_setup.bat
✅ This checks your Python and FFmpeg environment and auto-installs any missing libraries.
```
📦 Python Dependencies
If you're installing manually, run:

```
pip install edge-tts
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client
pip install requests
```
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
Go to: Google Cloud Console

Enable YouTube Data API v3

Create OAuth 2.0 client credentials

Save client_secrets.json inside the .n8n/ folder

The first run will automatically generate a token.pickle file

🖼️ Pexels API Setup
Go to: Pexels API

Create an account and get your API key

In stitch_scene.py, replace the placeholder with your key:

Edit
```
PEXELS_API_KEY = "YOUR_KEY_HERE"
```
▶️ How To Run
Use the Manual Trigger in n8n to test

Or activate the Schedule Trigger (every 80 minutes by default)

💡 Why This Rocks
🏠 Runs 100% local — no OpenAI, no cloud fees

🛠️ Auto-installs everything with auto_setup.bat

🎙️ High-quality audio from Edge TTS

🤖 Smarter AI-generated dialogue + visuals

🔁 Self-cleaning after every run

🔌 Easy to expand or tweak for your own use case
