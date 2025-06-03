northosc.pw – Cloud Server Project
==================================================

This documentation explains how I created, configured, and deployed a custom web server using AWS EC2 and various web technologies.

Server and Hosting
------------------
- IaaS Provider: Amazon Web Services (EC2)
- OS: Ubuntu 22.04 LTS
- Web Server: Apache2
- Website Type: Static website using HTML, CSS, and JavaScript
- SSL: Enabled using Let's Encrypt (via Certbot)
- Domain: northosc.pw (Registered via GoDaddy and pointed to EC2 IP)

Steps to Create the Server
--------------------------

1. Launch EC2 Instance
   - Type: t2.micro (Free Tier)
   - OS: Ubuntu 22.04 LTS

2. SSH into Server
   - Use terminal: `ssh -i key.pem ubuntu@<public-ip>`

3. Install Apache Web Server
   - `sudo apt update && sudo apt install apache2`

4. Upload HTML/CSS/JS Files
   - Use SCP or SFTP to upload to `/var/www/html`
   - Example: `scp -i key.pem index.html ubuntu@<ip>:/var/www/html/`

5. Register and Configure Domain
   - Domain purchased through GoDaddy
   - Pointed A-record to EC2 public IP

6. Install and Configure SSL
   - `sudo snap install core && sudo snap install --classic certbot`
   - `sudo certbot --apache`
   - Ensure renewal: `sudo certbot renew --dry-run`

JavaScript and Features
-----------------------

- Typewriter Effect:
  - Cycles through status messages like “Server is running ✅”, “JavaScript is running normally 💻”

- Weather Card:
  - Uses geolocation + OpenCage API + Open-Meteo API to show location-based weather

- Horizontal Text Carousel:
  - Displays setup steps in an auto-rotating horizontal panel

- AOS Animation Library:
  - Animates sections into view as the user scrolls

Backup and Rebuild Notes
------------------------

To fully rebuild:
1. Launch EC2
2. Install Apache
3. Upload HTML/CSS/JS
4. Reconfigure domain + A-record
5. Install Certbot
6. Deploy SSL

Total rebuild time estimate: Under 2 hours
