# 🚀 Cloud Server Setup – `northosc.pw`

This guide helps you deploy your custom cloud project on an Ubuntu EC2 instance using Apache.

---

## 🔧 Prerequisites

- Ubuntu 22.04 EC2 instance
- Port 80 open (HTTP)
- SSH access to server
- (Optional) Domain name pointed to your EC2 instance

---

## 🛠️ Installation Steps

Paste the following into your terminal after SSH'ing into your EC2 instance:

```bash
#!/bin/bash

# Update system and install Apache
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y

# Allow HTTP traffic
sudo ufw allow in "Apache"

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Create your custom index.html
sudo bash -c 'cat <<EOF > /var/www/html/index.html'
```

<details>
<summary>▶️ Click to Expand Full HTML</summary>

<pre><code>
<!-- Replace this placeholder with the full HTML you've provided -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>northosc.pw – Cloud Server Project</title>
  ...
</html>
</code></pre>

</details>

```bash
# Complete heredoc and restart Apache
EOF

# Restart Apache to load new content
sudo systemctl restart apache2

echo "✅ Setup complete – visit your site via public IP or domain."
```

---

## 🌐 Access the Site

Visit:

```
http://<your-ec2-public-ip>
```

Or your custom domain if configured, e.g., `http://northosc.pw`.

---

## ✅ Optional: Enable HTTPS

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```
