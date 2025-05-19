```
  ____ _                 _   ____                           
 / ___| | ___  _   _  __| | / ___|  ___ _ ____   _____ _ __ 
| |   | |/ _ \| | | |/ _` | \___ \ / _ \ '__\ \ / / _ \ '__|
| |___| | (_) | |_| | (_| |  ___) |  __/ |   \ V /  __/ |   
 \____|_|\___/ \__,_|\__,_| |____/ \___|_|    \_/ \___|_|   
```

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
- SSL certificate via **Certbot**
- DNS configured with GoDaddy

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
