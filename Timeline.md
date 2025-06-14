# 🗓️ northosc.pw – Project Timeline Documentation

This document outlines the chronological steps taken to build and deploy the **northosc.pw** cloud server project, including command-line actions and corresponding code implementations.

---

## 🗓️ 22/05/2025 – Launched Ubuntu EC2 Instance

- Created an EC2 instance using the AWS Management Console.
- Selected **Ubuntu 20.04** (Free Tier eligible).
- Opened ports 22 (SSH) and 80 (HTTP) in the Security Group.
- Downloaded key pair `webserver-key.pem`.

---

## 🗓️ 22/05/2025 – Connected via SSH and Updated Packages

```bash
ssh -i "webserver-key.pem" ubuntu@<public-ip>
sudo apt update
```

---

## 🗓️ 22/05/2025 – Installed Apache Web Server

```bash
sudo apt install apache2 -y
```

- Verified by visiting the public IP in a browser to see Apache default page.

---

## 🗓️ 22/05/2025 – Replaced Apache Default Page with Custom HTML

```bash
cd /var/www/html
sudo rm index.html
sudo nano index.html
```

- Pasted custom HTML content into `index.html`.

---

## 🗓️ 23/05/2025 – Linked Domain via GoDaddy

- Purchased domain `northosc.pw` via GoDaddy.
- Added an **A Record** pointing to the EC2 public IP.
- Waited for DNS propagation to complete (approx. 10 minutes).

---

## 🗓️ 23/05/2025 – Enabled HTTPS with Certbot

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

- Provided email, accepted TOS, selected domain.
- Verified HTTPS was working via browser (padlock icon and https:// prefix).

---

## 🗓️ 24/05/2025 – Implemented Animated SVG Preloader

```html
<div id="preloader">
  <svg viewBox="0 0 600 100" class="north-draw">
    <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle">NORTH</text>
  </svg>
</div>
```

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

## 🗓️ 24/05/2025 – Added Typing Text Animation

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

## 🗓️ 25/05/2025 – Integrated Weather APIs (OpenCage & Open-Meteo)

```js
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

---

## 🗓️ 25/05/2025 – Added Bandwidth Usage Simulation with Chart.js

```html
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<canvas id="bandwidthChart" width="400" height="200"></canvas>
```

```js
const ctx = document.getElementById('bandwidthChart').getContext('2d');
const chartData = {
  labels: Array.from({ length: 10 }, (_, i) => `${i}s`),
  datasets: [
    {
      label: 'Download (Mbps)',
      data: Array(10).fill(0),
      borderColor: 'blue',
      backgroundColor: 'rgba(0, 123, 255, 0.2)',
      tension: 0.4,
      fill: true
    },
    {
      label: 'Upload (Mbps)',
      data: Array(10).fill(0),
      borderColor: 'green',
      backgroundColor: 'rgba(40, 167, 69, 0.2)',
      tension: 0.4,
      fill: true
    }
  ]
};

const chart = new Chart(ctx, {
  type: 'line',
  data: chartData,
  options: {
    responsive: true,
    scales: {
      y: { beginAtZero: true },
      x: { title: { display: true, text: 'Time (s)' } }
    }
  }
});

let elapsed = 10;
setInterval(() => {
  const dl = (Math.random() * 50 + 10).toFixed(2);
  const ul = (Math.random() * 20 + 5).toFixed(2);
  chartData.labels.push(`${elapsed++}s`);
  chartData.labels.shift();
  chartData.datasets[0].data.push(dl);
  chartData.datasets[0].data.shift();
  chartData.datasets[1].data.push(ul);
  chartData.datasets[1].data.shift();
  chart.update();
}, 2000);
```

---

## 🗓️ 26/05/2025 – Enabled Scroll Animations with AOS

```html
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
  AOS.init({ duration: 1000, once: true });
</script>
```

```html
<section data-aos="fade-up"> ... </section>
```

---

## 🗓️ 26/05/2025 – Added GitHub Markdown Timeline Integration

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

## 🗓️ 27/05/2025 – Added Smooth Scroll-Based Section Highlighting

```js
const sections = document.querySelectorAll("section");
const navLinks = document.querySelectorAll("header nav a");
window.addEventListener("scroll", () => {
  let scrollY = window.scrollY;
  sections.forEach(section => {
    const offset = section.offsetTop - 150;
    const height = section.offsetHeight;
    const id = section.getAttribute("id");
    if (scrollY >= offset && scrollY < offset + height) {
      navLinks.forEach(link => {
        link.classList.remove("active");
        if (link.getAttribute("href") === `#${id}`) {
          link.classList.add("active");
        }
      });
    }
  });
});
```

---

## 🗓️ 27/05/2025 – Added Preloader Auto-Fade on Load

```js
window.addEventListener("load", () => {
  setTimeout(() => {
    const preloader = document.getElementById("preloader");
    preloader.style.transition = "opacity 1s ease";
    preloader.style.opacity = "0";
    setTimeout(() => preloader.remove(), 1000);
  }, 3000);
});
```

---

## 📄 Acknowledgments

This project used various free APIs and open-source tools including:

- [Open-Meteo](https://open-meteo.com/) for weather data
- [OpenCage](https://opencagedata.com/) for geolocation
- [Chart.js](https://www.chartjs.org/) for charts
- [AOS](https://michalsnik.github.io/aos/) for animations
- [Marked.js](https://marked.js.org/) for rendering Markdown

Portions of this project were assisted using **ChatGPT** for JavaScript development, debugging, and integration support, some aspects of this project were generated by ChatGPT.
