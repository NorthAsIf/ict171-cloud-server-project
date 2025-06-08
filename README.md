# 🌐 [northosc.pw](https://northosc.pw) – Cloud Server Project

## 👤 Student Details

- **Name**: Ryan  
- **Student ID**: 35204517  
- **Live Site**: https://northosc.pw  
- **Global IP**: 3.27.222.26  
- **Domain Registrar**: GoDaddy  
- **Cloud Provider**: AWS EC2 (Ubuntu 20.04)

---

## 📌 Project Overview

This project was completed for the ICT171 unit to demonstrate manual deployment of a cloud-based web server. The website is hosted on an AWS EC2 instance using Apache2 and showcases various frontend technologies, scripting, API integrations, and interactive UI features.

---

## ⚙️ Setup & Deployment Instructions

### 1. Launch EC2 Instance

- Choose Ubuntu 20.04 (Free Tier)
- Open ports 22 (SSH) and 80 (HTTP)

### 2. Connect via SSH

```bash
ssh -i "webserver-key.pem" ubuntu@3.27.222.26
```

### 3. Install Apache2

```bash
sudo apt update
sudo apt install apache2 -y
```

### 4. Replace Default Webpage

```bash
cd /var/www/html
sudo rm index.html
sudo nano index.html
```

Or upload from your local machine:

```bash
scp -i webserver-key.pem index.html ubuntu@3.27.222.26:/var/www/html/
```

### 5. Link Domain via GoDaddy

- Set A record pointing to `3.27.222.26`
- Wait for DNS to propagate

### 6. Enable HTTPS with Certbot

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

---

## 🌟 Website Features

- ✅ SVG preloader animation ("NORTH")
- ✅ Typing effect (status cycling)
- ✅ AOS scroll-triggered animations
- ✅ Bandwidth usage simulation (Chart.js)
- ✅ Real-time weather widget (Open-Meteo)
- ✅ Geolocation via OpenCage API
- ✅ Scroll-aware nav highlighting
- ✅ GitHub Markdown timeline/docs rendering

---

## 📦 APIs & Libraries Used

| Feature            | API / Library          |
|--------------------|------------------------|
| Weather Data       | Open-Meteo API         |
| Geolocation        | OpenCage API           |
| Scroll Animation   | AOS (Animate on Scroll)|
| Bandwidth Chart    | Chart.js               |
| Markdown Rendering | Marked.js              |
| SSL/TLS            | Let's Encrypt (Certbot)|

---

## 🧾 Code Sample (Weather Integration)

```javascript
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(async (position) => {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    const weatherURL = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`;

    try {
      const res = await fetch(weatherURL);
      const weather = await res.json();
      const temp = weather.current_weather.temperature;
      const wind = weather.current_weather.windspeed;

      document.querySelector("#weather h2").textContent = `${temp}°C`;
      document.querySelector("#weather p:nth-of-type(1)").textContent = `Wind: ${wind} km/h`;
    } catch (e) {
      console.error("Weather fetch error:", e);
    }
  });
} else {
  document.querySelector("#weather h1").textContent = "Geolocation not supported";
}
```

**Explanation**:  
This script gets the user's coordinates and uses Open-Meteo to fetch weather data. It then updates the UI in real-time.

---

## 📅 Project Timeline

📄 [View the full Timeline.md](https://github.com/NorthAsIf/ict171-cloud-server-project/blob/main/Timeline.md)

_This project was built and improved over 4+ weeks. The timeline documents all technical milestones._

---

## 🎥 Explainer Video

🎬 [Watch the Explainer Video](https://your-video-link-here)

---

## 📚 References

- [AWS EC2](https://aws.amazon.com/ec2/)
- [GoDaddy DNS Manager](https://www.godaddy.com/)
- [Open-Meteo API](https://open-meteo.com/)
- [OpenCage Geocoder](https://opencagedata.com/)
- [Chart.js](https://www.chartjs.org/)
- [AOS Scroll Animations](https://michalsnik.github.io/aos/)
- [Marked.js](https://marked.js.org/)
- [Certbot SSL](https://certbot.eff.org/)
- [MDN Web Docs](https://developer.mozilla.org/)

---

## 🤖 ChatGPT Usage

The frontend structure (HTML/CSS/JavaScript) was designed with assistance from ChatGPT. All code was manually reviewed and adapted to meet the project goals.

