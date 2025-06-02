# 📅 northosc.pw – Project Timeline Documentation

This document outlines the chronological steps taken to build and deploy the **northosc.pw** cloud server project, including command-line actions and corresponding code implementations.

---

## 🗓️ 2025-05-01 – Launched Ubuntu EC2 Instance

- Created an EC2 instance using the AWS Management Console.
- Selected **Ubuntu 20.04** (Free Tier eligible).
- Opened ports 22 (SSH) and 80 (HTTP) in the Security Group.
- Downloaded key pair `webserver-key.pem`.

---

## 🗓️ 2025-05-01 – Connected via SSH and Updated Packages

```bash
ssh -i "webserver-key.pem" ubuntu@<public-ip>
sudo apt update
```

---

## 🗓️ 2025-05-01 – Installed Apache Web Server

```bash
sudo apt install apache2
```

- Verified by visiting the public IP in a browser to see Apache default page.

---

## 🗓️ 2025-05-02 – Created HTML Directory and Custom index.html

```bash
cd /var/www/html
sudo nano index.html
```

- Replaced the default HTML with a custom-designed structure, later updated progressively.

---

## 🗓️ 2025-05-03 – Implemented Animated SVG Preloader

- Added this SVG loader in the HTML body:

```html
<div id="preloader">
  <svg viewBox="0 0 600 100" class="north-draw">
    <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle">NORTH</text>
  </svg>
</div>
```

- Associated CSS for animation:

```css
.north-draw text {
  font-size: 80px;
  stroke-dasharray: 1000;
  stroke-dashoffset: 1000;
  animation: drawText 3s ease forwards;
}

@keyframes drawText {
  to {
    stroke-dashoffset: 0;
  }
}
```

---

## 🗓️ 2025-05-03 – Added Typing Text Animation

- Used JavaScript `typeWriter()` and `loopTypewriter()` to rotate phrases.
```js
const typewriterPhrases = ["Server is running ✅", "JavaScript is running normally 💻", "Cloud connection established 🌐"];
```

---

## 🗓️ 2025-05-04 – Integrated Weather APIs (OpenCage & Open-Meteo)

- Added client-side `fetch()` logic:
```js
const geocodeUrl = `https://api.opencagedata.com/geocode/v1/json?q=${lat}+${lon}&key=API_KEY`;
const weatherUrl = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`;
```

---

## 🗓️ 2025-05-04 – Added Bandwidth Usage Simulation Chart

- Chart.js CDN loaded in `<head>`
- JavaScript simulation updated every 2 seconds:
```js
setInterval(() => {
  // simulate and push data
  bandwidthChart.update();
}, 2000);
```

---

## 🗓️ 2025-05-05 – Enabled Scroll Animations

- Included AOS Library via CDN.
```html
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
  AOS.init({ duration: 1000, once: true });
</script>
```
- All `<section>` elements were tagged with `data-aos="fade-up"`.

---

For full code, see: [GitHub Repository](https://github.com/NorthAsIf/ict171-cloud-server-project)