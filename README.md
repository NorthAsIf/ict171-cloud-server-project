# 🌐 Cloud Server Project – northosc.pw

This project was created for **ICT171 – Introduction to Computer Systems** to demonstrate practical skills in deploying cloud-based infrastructure using an **IaaS (Infrastructure-as-a-Service)** model. It showcases:

- Deployment of a lightweight, secure web server on **AWS EC2**
- Manual configuration of **Apache2**, **DNS via GoDaddy**, and **SSL via Certbot**
- JavaScript-based frontend features like real-time weather data, geolocation, animations, and simulated bandwidth graphs
- API integration with **OpenCage Geocoding** and **Open-Meteo Weather**

---

**👤 Name:** Reinhardt Nieuwoudt  
**🆔 Student ID:** 35204517  

---

## 🔗 Live Deployment

- **Public IP:** `13.211.45.67`  
- **Domain:** [https://northosc.pw](https://northosc.pw)

---

## 📄 Project Overview

This cloud server was manually configured with:

- ✅ Ubuntu Server 22.04 (via AWS EC2)
- ✅ Apache2 Web Server
- ✅ SSL certificate via **Certbot** (Let's Encrypt)
- ✅ DNS configuration via **GoDaddy**
- ✅ Live API integration with:
  - [OpenCage Geocoding API](https://opencagedata.com) – for user location
  - [Open-Meteo API](https://open-meteo.com) – for real-time weather

---

## 💡 Key Features

- 🔐 HTTPS-enabled secure website  
- 🌦️ Weather card based on real-time location  
- 📈 Simulated bandwidth usage with live updating graph  
- ✨ Animated preloader and scroll-based section highlights  
- 📜 Fully documented server configuration  
- 🔁 Custom shell script for automation

---

## 🧠 Example Setup Script

```bash
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo ufw allow 'Apache Full'
sudo systemctl enable apache2
sudo systemctl start apache2
```

_This script installs and configures Apache2 with firewall rules and starts the service._

---

## 🎥 Video Walkthrough

📺 [Watch the video walkthrough here](https://youtu.be/example)  
*Includes a demonstration of deployment, scripting, DNS setup, and API integrations.*

---

## 🗂️ Files Included

- `index.html` – Complete project site
- `setup.sh` – Apache setup script
- `documentation.pdf` – Full technical setup guide (optional)
- `images/` – Screenshots of key steps and UI

---

## 📚 References

- OpenCage Geocoding API: https://opencagedata.com
- Open-Meteo Weather API: https://open-meteo.com
- Certbot: https://certbot.eff.org/
- Apache2: https://httpd.apache.org/
- AWS EC2: https://aws.amazon.com/ec2/

---

> 📝 This project complies with ICT171 guidelines: hosted on IaaS (not SaaS), uses scripting for functionality, and is fully documented for reproducibility.
