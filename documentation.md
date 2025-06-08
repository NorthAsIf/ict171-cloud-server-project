# 📘 ICT171 Cloud Server Project Documentation

**Name**: Reinhardt Nieuwoudt  
**Student ID**: 35204517  
**Live Site**: [https://northosc.pw](https://northosc.pw)  
**Public IP**: 13.239.136.17  
**GitHub**: [https://github.com/NorthAsIf/ict171-cloud-server-project](https://github.com/NorthAsIf/ict171-cloud-server-project)

---

## 🔧 Project Overview

This documentation outlines the deployment and configuration of a cloud-hosted website using AWS EC2, Apache, and custom HTML, CSS, and JavaScript. The project includes domain name setup, SSL encryption, API integration, and live UI features. It was created to demonstrate proficiency in Infrastructure as a Service (IaaS) and web technologies for the ICT171 unit.

---

## ☁️ Server Setup Instructions

### 1. Launch EC2 Instance
- Platform: AWS EC2
- Image: Ubuntu 20.04 LTS
- Type: `t2.micro` (Free Tier)
- Inbound Rules: Allow **SSH (22)** and **HTTP (80)**
- Generate key: `webserver-key.pem`

### 2. Connect via SSH
```bash
ssh -i "webserver-key.pem" ubuntu@<public-ip>
```

### 3. Update and Install Apache
```bash
sudo apt update
sudo apt install apache2 -y
```

### 4. Deploy Website
```bash
cd /var/www/html
sudo rm index.html
sudo nano index.html  # Paste custom HTML code
```

Or upload from your computer:
```bash
scp -i webserver-key.pem index.html ubuntu@<ip>:/var/www/html/
```

### 5. Configure Domain (GoDaddy)
- Domain: `northosc.pw`
- DNS: A-record pointing to EC2 public IP

### 6. Enable HTTPS with Certbot
```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

Certbot auto-generates SSL certificates and applies secure HTTP redirection.

---

## 🧠 Key JavaScript Features

- **Preloader Animation**: Animated SVG spelling “NORTH”
- **Typing Effect**: Cycles through status messages
- **Weather Integration**: Uses OpenCage + Open-Meteo APIs to show location-based weather
- **Bandwidth Chart**: Simulated download/upload stats using Chart.js
- **AOS Animation**: Fade-in effects on scroll
- **GitHub Markdown Loading**: Uses Marked.js to display docs directly from GitHub

---

## 🌐 API Integrations

### OpenCage Geocoder
- Converts geolocation coordinates to readable place names

### Open-Meteo
- Provides real-time weather conditions (temperature, windspeed, time)

Both APIs are called via `fetch()` using async/await and updated dynamically in the DOM.

---

## 💡 Code Sample (Weather Script)

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

📝 This script uses the browser's geolocation API, fetches real-time weather, and displays it on the homepage.

---

## 📅 Project Timeline

View the full GitHub-hosted timeline:  
🔗 [Timeline.md](https://github.com/NorthAsIf/ict171-cloud-server-project/blob/main/Timeline.md)

### Key Milestones
- **22/05/2025** – EC2 instance launched, Apache installed  
- **23/05/2025** – Domain name linked via GoDaddy  
- **23/05/2025** – HTTPS configured using Certbot  
- **24/05/2025** – Website deployed with custom UI  
- **25/05/2025** – APIs integrated for weather and data charts  
- **26–27/05/2025** – Scroll animations, auto-highlight nav, and GitHub-linked docs added  

---

## 🔗 References (APA 7th Edition)

- Amazon Web Services. (n.d.). *Amazon EC2*. https://aws.amazon.com/ec2/  
- AOS. (n.d.). *Animate on scroll library*. https://michalsnik.github.io/aos/  
- Certbot. (n.d.). *Certbot: Make the web more secure*. https://certbot.eff.org/  
- Chart.js. (n.d.). *Chart.js documentation*. https://www.chartjs.org/  
- GitHub. (n.d.). *Amazon EC2 web services tutorial*. SCH-IT Murdoch Uni Networking Labs. https://github.com/SCH-IT-MurdochUni/NetworkingLabs/blob/main/Server_Environments_and_Architectures/amazon_ec2_web_services.md  
- GoDaddy. (n.d.). *DNS management and domain configuration*. https://www.godaddy.com/  
- Marked.js. (n.d.). *Markdown parser and compiler*. https://marked.js.org/  
- Mozilla Developer Network. (n.d.). *MDN Web Docs*. https://developer.mozilla.org/  
- OpenCage Geocoder. (n.d.). *Geocoding API*. https://opencagedata.com/  
- Open-Meteo. (n.d.). *Weather API documentation*. https://open-meteo.com/  

---
