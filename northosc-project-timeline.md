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

- Replaced the default HTML with a custom-designed structure.

---

## 🗓️ 2025-05-03 – Implemented Animated SVG Preloader

**HTML:**
```html
<div id="preloader">
  <svg viewBox="0 0 600 100" class="north-draw">
    <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle">NORTH</text>
  </svg>
</div>
```

**CSS:**
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

**JavaScript:**
```js
const phrases = ["Server is running ✅", "JavaScript is running 💻", "Cloud connected 🌐"];
let idx = 0;

function typeWriter(txt, el, speed = 60, cb = null) {
  let i = 0;
  const target = document.getElementById(el);
  target.textContent = "";
  function type() {
    if (i < txt.length) {
      target.textContent += txt.charAt(i++);
      setTimeout(type, speed);
    } else if (cb) setTimeout(cb, 1500);
  }
  type();
}

function loopTyping() {
  typeWriter(phrases[idx], "status", 60, () => {
    idx = (idx + 1) % phrases.length;
    loopTyping();
  });
}
loopTyping();
```

---

## 🗓️ 2025-05-04 – Integrated Weather APIs (OpenCage & Open-Meteo)

**JavaScript (snippet):**
```js
const geoURL = `https://api.opencagedata.com/geocode/v1/json?q=${lat}+${lon}&key=API_KEY`;
const weatherURL = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true`;

fetch(weatherURL).then(res => res.json()).then(data => {
  // update DOM
});
```

---

## 🗓️ 2025-05-04 – Added Bandwidth Usage Simulation Chart

**Chart.js Setup:**
```html
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<canvas id="bandwidthChart" width="400" height="200"></canvas>
```

**JavaScript:**
```js
const ctx = document.getElementById('bandwidthChart').getContext('2d');
const chart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [...],
    datasets: [...]
  },
  options: { responsive: true }
});

setInterval(() => {
  // update chart data dynamically
  chart.update();
}, 2000);
```

---

## 🗓️ 2025-05-05 – Enabled Scroll Animations with AOS

**CDN + Init:**
```html
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
  AOS.init({ duration: 1000, once: true });
</script>
```

**Usage:**
```html
<section data-aos="fade-up"> ... </section>
```

---

## 🗓️ 2025-05-06 – GitHub Markdown Timeline Integration

**Script:**
```html
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
  fetch('https://raw.githubusercontent.com/NorthAsIf/ict171-cloud-server-project/main/Timeline.md')
    .then(res => res.text())
    .then(md => {
      document.getElementById('timeline-container').innerHTML = marked.parse(md);
    });
</script>
```

---