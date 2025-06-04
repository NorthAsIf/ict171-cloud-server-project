# 🌐 northosc.pw – Cloud Server Project

This project demonstrates the manual deployment of a public-facing web server on AWS EC2 running Ubuntu 20.04 with Apache2. It hosts a custom-built HTML/CSS/JavaScript site showcasing dynamic animations, weather and bandwidth simulations, and responsive UI.

## 📌 Project Overview

The goal of this project was to explore the principles of Infrastructure as a Service (IaaS) by deploying and configuring a cloud-based web server from the ground up. The server is hosted on an Amazon Web Services (AWS) EC2 instance running Ubuntu 20.04 and serves a dynamic, single-page HTML website accessible via a registered domain name.

The project is intended as a long-term portfolio piece and learning platform to showcase proficiency in:
- Linux server administration
- Manual setup and deployment of web technologies
- Use of APIs to add real-time interactivity
- Frontend development with HTML, CSS, and JavaScript
- Version control and professional documentation via GitHub
- Integration of third-party libraries (e.g., AOS, Chart.js)

The resulting website includes a custom preloader animation, animated typing header, live weather reporting, simulated bandwidth monitoring, and scroll-based animation effects. The backend configuration was completed manually to demonstrate a full understanding of cloud infrastructure setup without the use of automated installation tools or CMS platforms.

This project also serves to demonstrate best practices in documenting technical projects so that they are easily replicable by peers or colleagues.

- **Student Name**: [Your Name]
- **Student Number**: [Your Student Number]
- **Live Site**: [http://northosc.pw](http://northosc.pw)
- **Global IP**: `3.27.222.26`
- **Cloud Platform**: AWS EC2 (Ubuntu 20.04)
- **Web Stack**: Apache2, HTML5, CSS3, JavaScript
- **Domain Registrar**: GoDaddy
- **Purpose**: Learn and demonstrate Infrastructure as a Service (IaaS), scripting, API integration, and technical documentation.

---

## 🔧 Project Features

- ✅ Animated SVG weather icons mapped to Open-Meteo weather codes
- ✅ Real-time weather via Open-Meteo + OpenCage API
- ✅ Bandwidth usage simulation using Chart.js
- ✅ AOS (Animate On Scroll) for smooth scroll animations
- ✅ Typing text animation on homepage
- ✅ Line-based animated preloader morphing into “NORTH”
- ✅ Responsive design using custom CSS and no frameworks
- ✅ Hosted securely on AWS with public IP and DNS

---

## 🔧 How to Rebuild This Server (From Scratch)

### 1. Launch Ubuntu EC2 Instance

- Login to AWS EC2
- Launch Ubuntu 20.04 (Free Tier)
- Configure:
  - Allow inbound ports: **22 (SSH)** and **80 (HTTP)**
- Download your key (e.g., `webserver-key.pem`)

### 2. SSH into the Instance

```bash
ssh -i "webserver-key.pem" ubuntu@your-public-ip
```

### 3. Install Apache2

```bash
sudo apt update
sudo apt install apache2 -y
```

### 4. Deploy the Website

```bash
cd /var/www/html
sudo rm index.html
sudo nano index.html
# Paste contents of index.html from this repo
```

Or upload via `scp`:

```bash
scp -i webserver-key.pem index.html ubuntu@your-ip:/var/www/html/
```

### 5. Link Domain (DNS Settings on GoDaddy)

- Point `A record` to your EC2 public IP (`3.27.222.26`)
- Wait for DNS propagation (can take up to 10 min)

---

## 🔁 Required Scripts and APIs

### JavaScript Dependencies

- AOS (Animate on Scroll)
- Chart.js (bandwidth graph)
- Open-Meteo API (weather)
- OpenCage API (location → coordinates)

Example snippet from `weather.js`:

```javascript
fetch("https://api.open-meteo.com/v1/forecast?...")
  .then(res => res.json())
  .then(data => updateWeather(data));
```

---

## 🎞️ Explainer Video

🎥 **[Watch the project video here](https://your-video-link.com)**  
*(Upload to YouTube, Google Drive or OneDrive – unlisted is fine)*

---

## 💬 Final Notes

This documentation enables a complete reinstallation of the project from scratch, following IaaS principles and manual configuration. All code is original or credited and adheres to the ICT171 assessment rubric.

---

## 🔗 Resources & Credits

- [Chart.js Documentation](https://www.chartjs.org/)
- [AOS Library](https://michalsnik.github.io/aos/)
- [Open-Meteo](https://open-meteo.com/)
- [OpenCage Geocoder](https://opencagedata.com/)
- [Weather Icons – Meteocons](https://bas.dev/work/meteocons)
****
