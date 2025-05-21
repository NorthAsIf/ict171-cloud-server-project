🌐 Cloud Server Project
A lightweight, secure web server hosted on AWS EC2 using Apache, DNS, and SSL.
Built for ICT171 to demonstrate IaaS deployment, scripting, and server configuration.

Name: Reinhardt Nieuwoudt  
Student ID: 35204517

🔗 Live Server  
Public IP: 13.211.45.67  
Domain: https://northosc.pw

📄 Project Overview  
This cloud server was deployed using AWS EC2 (IaaS model) and manually configured with:
- Ubuntu Server 22.04  
- Apache2 Web Server  
- SSL certificate via Certbot  
- DNS configured with GoDaddy  

💡 Features  
- Secure HTTPS-enabled website  
- Fully documented server setup  
- Custom JavaScript features (Typewriter, Weather Card, Carousel)  
- Animations using AOS  
- Live geolocation-based weather API  

🧠 Script  
This script installs and configures Apache2 and opens the firewall:

```bash
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo ufw allow 'Apache Full'
```

🎥 Video Walkthrough  
📺 Watch it here (if applicable)

🗂️ Files Included  
- `index.html` – Main webpage  
- `setup.sh` – Shell script for server config  
- `images/` – Screenshots and visuals  
- `cloud_server_documentation.txt` – This file  

📚 References  
- [Certbot Documentation](https://certbot.eff.org/)  
- [Murdoch Library Referencing](https://libguides.murdoch.edu.au/APA/all)
