# 🚀 **northosc.pw – Cloud Server Setup Guide**

Welcome! This guide will help you deploy a modern, animated HTML/JS site to an AWS EC2 instance running Ubuntu, using Apache as the web server, and integrate APIs for live weather and location data.

---

## ⚙️ **Prerequisites**
Before you start, make sure you have:

- An **Ubuntu 22.04 EC2 instance** running
- Port **80 (HTTP)** and **443 (HTTPS)** open in your security group
- A domain name (optional but recommended)
- SSH access to your server

---

## 🛠️ **Setup Instructions**

### 🔄 Step 1: Update and Upgrade
```bash
sudo apt update && sudo apt upgrade -y
```

### 🌐 Step 2: Install Apache Web Server
```bash
sudo apt install apache2 -y
```

### 🔓 Step 3: Allow HTTP Through Firewall
```bash
sudo ufw allow in "Apache"
```

### 🔁 Step 4: Enable Apache on Boot
```bash
sudo systemctl enable apache2
```

### ▶️ Step 5: Start Apache Now
```bash
sudo systemctl start apache2
```

---

## 🧾 **Deploy Your Website**

### 📄 Step 6: Replace Apache's Default Page

Run this:
```bash
sudo bash -c 'cat <<EOF > /var/www/html/index.html'
```

Then paste your full HTML here (including your animated preloader, weather, etc.)

Close with:
```bash
EOF
```

### 🔃 Step 7: Restart Apache
```bash
sudo systemctl restart apache2
```

---

## 🔐 **Enable HTTPS (Recommended)**

### 🛡️ Step 8: Install Certbot & Enable SSL
```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

Follow the prompts to issue a free SSL certificate via Let's Encrypt.

---

## 🌍 **API Integration Guide**

### 🗺️ OpenCage Geocoding API
- Converts latitude/longitude to a human-readable location.
- 🔗 [https://opencagedata.com](https://opencagedata.com)
```js
const GEOCODE_API_KEY = 'your-key';
const url = `https://api.opencagedata.com/geocode/v1/json?q=${lat}+${lon}&key=${GEOCODE_API_KEY}`;
```

### ☁️ Open-Meteo Weather API
- Provides real-time weather data.
- No API key required.
- 🔗 [https://open-meteo.com](https://open-meteo.com)
```js
const weatherUrl = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`;
```

---

## ✅ **Final Check**

After all steps:

- 🔗 Visit your site: `http://<your-ec2-ip>` or `https://yourdomain.com`
- 🔎 Test live weather and geolocation features
- 🔒 Ensure the SSL padlock appears if HTTPS is enabled

---

### 🙌 **Done!**
You've deployed a secure, interactive cloud-hosted site with real-time features. Nice work!

