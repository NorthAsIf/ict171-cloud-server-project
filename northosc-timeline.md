# 📅 northosc.pw – Project Timeline Documentation

This document outlines the chronological steps taken to build and deploy the northosc.pw cloud server project.

## 2025-05-01 – Launched Ubuntu EC2 Instance

- Created an EC2 instance using the AWS Management Console.
- Selected Ubuntu 20.04 (Free Tier eligible).
- Opened ports 22 (SSH) and 80 (HTTP) in the Security Group.
- Downloaded key pair `webserver-key.pem`.


## 2025-05-01 – Connected via SSH and Updated Packages

- Accessed instance via:
  ```bash
  ssh -i "webserver-key.pem" ubuntu@<public-ip>
  ```
- Updated package list:
  ```bash
  sudo apt update
  ```


## 2025-05-01 – Installed Apache Web Server

- Installed Apache2:
  ```bash
  sudo apt install apache2
  ```
- Verified Apache was running by visiting the public IP.


## 2025-05-02 – Created HTML Directory and Custom index.html

- Navigated to web directory:
  ```bash
  cd /var/www/html
  ```
- Edited default page:
  ```bash
  sudo nano index.html
  ```
- Replaced with custom HTML and JavaScript content.


## 2025-05-03 – Implemented Animated Preloader and Typing Effect

- Added SVG-based animation for the word 'NORTH'.
- Used JavaScript for dynamic typing animation.


## 2025-05-04 – Integrated Weather API (Open-Meteo & OpenCage)

- Installed and configured Open-Meteo and OpenCage API calls in JavaScript.
- No server-side package installation required (browser-side fetch).


## 2025-05-04 – Added Bandwidth Simulation Chart

- Used Chart.js to display a simulated bandwidth usage chart.
- Script updates chart values dynamically every 2 seconds.


## 2025-05-05 – Enabled Scroll Animations

- Integrated AOS (Animate On Scroll) library via CDN.
- Added `data-aos` attributes to all sections.


