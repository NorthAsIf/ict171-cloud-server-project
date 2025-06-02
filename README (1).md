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

## 🌐 3. Install Apache2 Web Server

```bash
sudo apt update
sudo apt install apache2
```

To verify, open a web browser and visit your public IP (e.g., `http://your-ec2-ip`). You should see the Apache2 default page.

---

## 📁 4. Create HTML Directory (if needed)

Apache uses `/var/www/html` as the default directory. This is where you’ll place your website files:

```bash
cd /var/www/html
```

---

## 📄 5. Deploy Your HTML Website

1. Navigate to the Apache web directory:

   ```bash
   cd /var/www/html
   ```

2. Remove the default Apache `index.html`:

   ```bash
   sudo rm index.html
   ```

3. Upload the provided `index.html` from this GitHub repository to the same directory using `scp`, or copy it manually using a text editor like `nano`:

   ```bash
   sudo nano index.html
   ```

   Then paste the contents from this repo and save.

4. Alternatively, use `scp` from your local machine:

   ```bash
   scp -i webserver-key.pem index.html ubuntu@your-ec2-ip:/var/www/html/
   ```

5. Visit your server IP:
   ```
   http://your-ec2-ip
   ```

---

## ⚙️ 6. Install JavaScript API Dependencies

This project uses browser-side APIs, so no backend installations are required, but you must include their script links:

- **AOS (Animate On Scroll)**:
  ```html
  <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
  ```

- **Chart.js**:
  ```html
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  ```

- **Open-Meteo API** and **OpenCage Geocoder** are used via `fetch()` in JavaScript. No server installation needed.

---

## 💡 7. Enable AOS Animations and Chart.js Scripts

Initialize AOS in your `<script>` block:

```javascript
AOS.init({ duration: 1000, once: true });
```

Configure your bandwidth chart using Chart.js.

---

## 🔚 Done!

You now have a fully functional and interactive web server hosted on the cloud, with modern UI features, real-time weather detection, and dynamic charts.