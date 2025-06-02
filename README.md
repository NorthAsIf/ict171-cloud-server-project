# northosc.pw – Cloud Server Project

This project demonstrates the deployment of a public web server on AWS EC2 running Ubuntu, Apache, and a custom HTML/CSS/JavaScript website. The site showcases cloud hosting, animated UI features, and real-time weather and bandwidth simulations using client-side APIs.

## 📌 Project Overview

- **Domain**: [northosc.pw](http://northosc.pw)
- **Platform**: AWS EC2 (Ubuntu 20.04)
- **Stack**: Apache2, HTML5, CSS3, JavaScript, REST APIs
- **Features**: Custom animated UI, dynamic typing effect, real-time weather, bandwidth simulation, scroll-triggered animations, and GitHub link integration.

---

## 🚀 1. Launch an Ubuntu Machine in AWS EC2

- Go to AWS and launch a new EC2 instance.
- Choose an **Ubuntu 20.04** image (Free Tier eligible).
- Accept default settings for storage (8GB).
- Skip tags.
- Under **Security Group**, allow:
  - **SSH** (port 22)
  - **HTTP** (port 80)
- Name your key pair (e.g., `webserver-key.pem`) and download it.
- Click **Launch Instance** and wait for it to initialize.

---

## 🔐 2. SSH into Your Cloud Server

1. Open a terminal (Mac/Linux) or PowerShell (Windows).
2. Navigate (`cd`) to the directory containing your `.pem` key.
3. Use the SSH command shown by AWS, e.g.:

```bash
ssh -i "webserver-key.pem" ubuntu@ec2-xx-xxx-xx-xx.compute-1.amazonaws.com
```

---

## 🌐 3. Install Apache Web Server

Once connected via SSH:

```bash
sudo apt update
sudo apt install apache2
```

Check your server is running by visiting:

```text
http://<your-ec2-public-ip>
```

---

## 📂 4. Create HTML Directory and Upload index.html

1. Move into Apache’s web root:

```bash
cd /var/www/html
```

2. Remove the default Apache index page:

```bash
sudo rm index.html
```

3. Create your own HTML file:

```bash
sudo nano index.html
```

4. Paste your website HTML code, then save and exit.

---

## 🌦️ 5. API Integration (No apt install required)

These APIs are used entirely through JavaScript (client-side):

### ✅ OpenCage Geocoding API

- Converts latitude and longitude into readable locations.
- Requires a free API key: [https://opencagedata.com](https://opencagedata.com)
- Example usage:

```js
fetch(`https://api.opencagedata.com/geocode/v1/json?q=${lat}+${lon}&key=YOUR_API_KEY`)
```

### ✅ Open-Meteo Weather API

- Provides real-time weather information.
- No API key required.
- Example usage:

```js
fetch(`https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`)
```

---

## 💡 6. JavaScript Features Implemented

- **Typing Animation**: Looped status messages simulating system health.
- **Preloader Animation**: Custom SVG "NORTH" animation that fades on page load.
- **Live Weather Card**: Shows your location, temperature, wind, and time using the APIs above.
- **Simulated Bandwidth Chart**: Real-time graph using Chart.js.
- **Scroll Animation**: AOS (Animate On Scroll) library used to animate sections on scroll.
- **Navigation Highlighting**: Active section link highlights based on scroll position.

---

## 🧰 7. Tools & Technologies Used

- **AWS EC2**
- **Apache2 Web Server**
- **HTML5, CSS3, JavaScript**
- **Chart.js**
- **AOS Animation Library**
- **OpenCage Geocoding API**
- **Open-Meteo Weather API**
- **GitHub for Version Control**

---

## 📬 8. Contact

Created by **Ryan** – Student ID: **35204517**  
For source code, visit the GitHub repository:  
[https://github.com/NorthAsIf/ict171-cloud-server-project](https://github.com/NorthAsIf/ict171-cloud-server-project)