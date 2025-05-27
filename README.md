# 🌐 Cloud Server Project

This project was created to demonstrate our learning of cloud-based infrastructure using an IaaS (Infrastructure-as-a-Service) model. It showcases:

Deployment of a lightweight, secure web server on AWS EC2

Use of Apache, DNS configuration, and SSL encryption

JavaScript-based features like real-time weather, geolocation, and animations

Built as part of ICT171, this project highlights key skills in server setup, frontend integration, and cloud service management.



**Name:** Reinhardt Nieuwoudt     
**Student ID:** 35204517  

---

## 🔗 Live Server
**Public IP:** `13.211.45.67`  
**Domain:** [https://northosc.pw](https://northosc.pw)

---

## 📄 Project Overview
This cloud server was deployed using **AWS EC2** (IaaS model) and manually configured with:
- Ubuntu Server 22.04

- Apache2 Web Server

- SSL certificate via Certbot

- DNS configured with GoDaddy

- Frontend integration with OpenCage Geocoding API and Open-Meteo Weather API for live location and weather data

---

## 💡 Features
- Secure HTTPS-enabled website
- Fully documented server setup
- Custom script to automate server updates

---

## 🧠 Script
```bash
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo ufw allow 'Apache Full'
```

_This script installs and configures Apache2 with firewall settings._

---

## 🎥 Video Walkthrough
📺 [Watch it here](https://youtu.be/example)

---

## 🗂️ Files Included
- `documentation.pdf` – Full technical setup guide
- `index.html` – Main webpage
- `setup.sh` – Shell script
- `images/` – Screenshots of setup

---

## 📚 References
- [Certbot Docs](https://certbot.eff.org/)
- [Murdoch Library Referencing](http://library.murdoch.edu.au/Students/Referencing/)
