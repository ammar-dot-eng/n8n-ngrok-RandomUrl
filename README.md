Perfect 😎 — here’s the improved README with **badges** added to the top for a polished GitHub look.

````markdown
# 🚀 n8n-ngrok-RandomUrl

[![Docker](https://img.shields.io/badge/Docker-Desktop-blue?logo=docker)](https://www.docker.com/products/docker-desktop/)
[![ngrok](https://img.shields.io/badge/ngrok-Random_URLs-orange?logo=ngrok)](https://ngrok.com/)
[![n8n](https://img.shields.io/badge/n8n-Automation-red?logo=n8n)](https://n8n.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Run **n8n** behind **ngrok** with Docker Compose — automatically updates n8n's webhook URL to the randomly-created ngrok URL each time you restart the stack, while keeping your n8n data persistent.

---

## ✨ What this does
- 🔄 Starts **n8n** and **ngrok** with Docker Compose  
- 🌐 Detects the ephemeral ngrok public URL and automatically assigns it to n8n webhooks  
- 💾 Keeps n8n's data persistent between restarts (so your workflows & credentials are safe)  
- ⚡ Perfect for quick, disposable public webhook endpoints without manual reconfiguration  

---

## 🌟 Features
- ✅ Automatic webhook reassignment when ngrok provides a new random URL  
- ✅ Data persistence across restarts (via Docker volumes)  
- ✅ Simple setup — only Docker Desktop and an ngrok account required  

---

## 📦 Prerequisites
1. 🐳 Docker Desktop installed: [Download here](https://www.docker.com/products/docker-desktop/)  
2. 🔑 An ngrok account: [Sign up here](https://dashboard.ngrok.com/)  
   _(you don’t need to install the ngrok client for this setup)_  
3. 📂 Git (to clone the repo) or download the repository ZIP  

---

## ⚡ Quick start

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd n8n-ngrok-RandomUrl
````

```env
# 2. Create / edit .env in the repository root
# Replace the placeholder with your ngrok auth token (no spaces).
NGROK_AUTH_TOKEN="your-ngrok-auth-token-here"
```

```bash
# 3. Start the stack (detached)
docker compose up -d

# (optional) watch logs for progress
docker compose logs -f
```

After startup, 🎉 n8n will automatically use the new ngrok URL as its webhook base.

---

## 🛑 Stop / Restart

To stop the stack:

```bash
docker compose down
```

To restart (and get a new ngrok URL):

```bash
docker compose up -d
```

---

## ⚠️ What to do if you hit the ngrok free-tier quota

If your ngrok free plan runs out of quota:

1. 🆕 Make another free ngrok account and grab a fresh auth token
2. ✍️ Replace the token in `.env`
3. 🔄 Restart the stack:

```bash
docker compose down
docker compose up -d
```

---

## 🔧 Troubleshooting & tips

* 📝 Check logs: `docker compose logs -f`
* ❌ Don’t leave spaces when pasting the token in `.env`
* 🕵️ If auth fails, verify your token on the ngrok dashboard
* 🔗 If webhooks fail, confirm the ngrok URL and that n8n updated correctly