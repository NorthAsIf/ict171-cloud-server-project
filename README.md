# 🌐 [northosc.pw](https://northosc.pw) – Cloud Server Project

## 👤 Student Details

- **Name**: Reinhardt Nieuwoudt 
- **Student ID**: 35204517  
- **Live Site**: https://northosc.pw  
- **Public IP**: 13.239.136.17  
- **Domain Registrar**: GoDaddy  
- **Cloud Provider**: AWS EC2 (Ubuntu 24.04)

---

## 📌 Project Overview

This project was completed as part of the ICT171 course to show my ability to deploy, configure, and document a fully functional cloud server. The goal was to construct a live website utilising Infrastructure as a Service (IaaS) through AWS EC2, create new web features with HTML, CSS, and JavaScript, and document the process so that others may replicate it. The website, northosc.pw, has dynamic frontend features like animations, a live weather area, and a simulated bandwidth chart. This effort combines real-time APIs, JavaScript graphing, and automated documentation retrieval through GitHub.

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

- Set A record pointing to `13.239.136.17`
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

## 📚 References (APA 7th Edition)

AOS. (n.d.). Animate on scroll library. https://michalsnik.github.io/aos/

Chart.js. (n.d.). Chart.js documentation. https://www.chartjs.org/

Certbot. (n.d.). Certbot: Make the web more secure. https://certbot.eff.org/

GitHub. (n.d.). Amazon EC2 Web Services tutorial. SCH-IT Murdoch Uni Networking Labs. https://github.com/SCH-IT-MurdochUni/NetworkingLabs/blob/main/Server_Environments_and_Architectures/amazon_ec2_web_services.md

Marked.js. (n.d.). Marked: Markdown parser and compiler. https://marked.js.org/

Mozilla Developer Network. (n.d.). MDN Web Docs. https://developer.mozilla.org/

OpenCage Geocoder. (n.d.). Geocoding API for developers. https://opencagedata.com/

Open-Meteo. (n.d.). Weather API documentation. https://open-meteo.com/

Amazon Web Services. (n.d.). Amazon EC2. https://aws.amazon.com/ec2/

GoDaddy. (n.d.). DNS management and domain configuration. https://www.godaddy.com/


## 🤖 ChatGPT Usage

The frontend structure (HTML/CSS/JavaScript) was designed with assistance from ChatGPT. All code was manually reviewed and adapted to meet the project goals.

