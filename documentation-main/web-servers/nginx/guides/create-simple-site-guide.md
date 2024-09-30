### Create simple website using Nginx web-server

#### Prerequisites

- A server or virtual machine with Ubuntu or another Linux distribution installed.
- Root or sudo access to the server.
- Basic knowledge of Linux command line.

### Step 1: Install Nginx

**Theoretical Information:**
Nginx (pronounced "engine-x") is an open-source web server software used for web serving, reverse proxying, caching, load balancing, media streaming, and more. It is known for its high performance, stability, rich feature set, simple configuration, and low resource consumption.

1. **Update the package list:**

   ```bash
   sudo apt update
   ```

   - **Explanation**: This command updates the package list for the APT package manager. It fetches the list of available updates for the software installed on your system, ensuring that you install the latest versions of any software.
   - **Source**: [Ubuntu Official Documentation](https://ubuntu.com/server/docs/package-management)

2. **Install Nginx:**

   ```bash
   sudo apt install nginx
   ```

   - **Explanation**: This command installs the Nginx package along with any required dependencies.
   - **Source**: [Nginx Installation on Ubuntu](https://nginx.org/en/linux_packages.html#Ubuntu)

3. **Start and enable Nginx:**

   ```bash
   sudo systemctl start nginx
   sudo systemctl enable nginx
   ```

   - **Explanation**: The first command starts the Nginx service immediately, while the second command enables it to start on boot.
   - **Source**: [DigitalOcean Nginx Guide](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04)

4. **Verify the installation:**
   - Open your web browser and navigate to your server’s IP address (e.g., http://your_server_ip). You should see the Nginx default welcome page.
   - **Explanation**: This verifies that Nginx is running correctly and serving pages.
   - **Source**: [Nginx Beginner’s Guide](https://nginx.org/en/docs/beginners_guide.html)

### Step 2: Configure a New Server Block (Virtual Host)

**Theoretical Information:**
A server block (or virtual host) in Nginx is a configuration directive that tells Nginx how to handle requests for a specific domain. Each server block can define settings such as the root directory, log files, and handling of various HTTP requests.

1. **Create a directory for your test website:**

   ```bash
   sudo mkdir -p /var/www/testsite.com/html
   ```

   - **Explanation**: This command creates the directory structure for your website. The `-p` flag ensures that parent directories are created as needed.
   - **Source**: [Linux Command Guide](https://linuxize.com/post/how-to-create-directories-in-linux-using-the-mkdir-command/)

2. **Assign ownership of the directory:**

   ```bash
   sudo chown -R $USER:$USER /var/www/testsite.com/html
   ```

   - **Explanation**: This changes the ownership of the directory to the current user. The `-R` flag applies the changes recursively.
   - **Source**: [Chown Command Guide](https://www.tecmint.com/chown-command-examples/)

3. **Set the correct permissions:**

   ```bash
   sudo chmod -R 755 /var/www/testsite.com
   ```

   - **Explanation**: This sets the permissions of the directory to `755`, meaning the owner has read, write, and execute permissions, while others have read and execute permissions.
   - **Source**: [Chmod Command Guide](https://www.guru99.com/file-permissions.html)

4. **Create a sample HTML file:**

   ```bash
   nano /var/www/testsite.com/html/index.html
   ```

   - **Explanation**: This command opens the Nano text editor to create an HTML file.
   - **Source**: [Nano Editor Guide](https://linuxize.com/post/how-to-use-nano-text-editor/)

   Add the following content to the file:

   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Welcome to testsite.com!</title>
   </head>
   <body>
       <h1>Success! The testsite.com server block is working!</h1>
   </body>
   </html>
   ```

   - **Explanation**: This HTML code creates a basic webpage with a title and a heading.
   - **Source**: [HTML Basics](https://www.w3schools.com/html/html_basic.asp)

5. **Create a new server block configuration file:**

   ```bash
   sudo nano /etc/nginx/sites-available/testsite.com
   ```

   - **Explanation**: This command opens a new configuration file in the Nano text editor within the `sites-available` directory.
   - **Source**: [Nginx Server Block Guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)

   Add the following configuration:

   ```nginx
   server {
       listen 80;
       server_name testsite.com www.testsite.com;

       root /var/www/testsite.com/html;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }
   }
   ```

   - **Explanation**: This server block configuration tells Nginx to listen on port 80, serve files from the specified root directory, and handle requests using the `try_files` directive.
   - **Source**: [Nginx Server Block Guide](https://nginx.org/en/docs/http/ngx_http_core_module.html#server)

6. **Enable the server block by creating a symbolic link:**

   ```bash
   sudo ln -s /etc/nginx/sites-available/testsite.com /etc/nginx/sites-enabled/
   ```

   - **Explanation**: This command creates a symbolic link in the `sites-enabled` directory, making the server block configuration active.
   - **Source**: [Linux Symlink Guide](https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-linux/)

7. **Test the Nginx configuration for syntax errors:**

   ```bash
   sudo nginx -t
   ```

   - **Explanation**: This command checks the Nginx configuration files for syntax errors.
   - **Source**: [Nginx Configuration Testing](https://nginx.org/en/docs/beginners_guide.html#preparing_your_configuration)

8. **Reload Nginx to apply the changes:**

   ```bash
   sudo systemctl reload nginx
   ```

   - **Explanation**: This command reloads the Nginx configuration without restarting the service, applying any changes made to the configuration files.
   - **Source**: [Nginx Beginner’s Guide](https://nginx.org/en/docs/beginners_guide.html#control)

### Step 3: Update the Hosts File (Local Testing)

**Theoretical Information:**
The hosts file on your local machine maps hostnames to IP addresses. By editing this file, you can test the configuration locally by pointing the domain name to your server’s IP address.

1. **Open the hosts file on your local machine:**
   - On Windows: `C:\Windows\System32\drivers\etc\hosts`
   - On macOS and Linux: `/etc/hosts`
   - **Explanation**: The hosts file is a system file that can be used to manually map hostnames to IP addresses. This allows you to test the server configuration locally without modifying DNS settings.
   - **Source**: [Hosts File Guide](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)

2. **Add the following line to the hosts file:**

   ```
   your_server_ip testsite.com www.testsite.com
   ```

   - **Explanation**: This line maps `testsite.com` and `www.testsite.com` to your server’s IP address, allowing you to access the site locally by entering these domain names in your browser.
   - **Source**: [Hosts File Guide](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)

### Step 4: Test the Configuration

1. **Open your web browser and navigate to <http://testsite.com>**.
   - **Explanation**: This step verifies that the server block configuration is correct and that Nginx is serving the correct content.

2. **You should see the sample HTML page with the message:**

   ```
   Success! The testsite.com server block is working!
   ```

   - **Explanation**: This message confirms that the server block is correctly configured and that Nginx is serving the expected content.

### Step 5: (Optional) Secure the Site with SSL

**Theoretical Information:**
SSL (Secure Sockets Layer) is a standard security technology for establishing an encrypted link between a server and a client. This ensures that all data passed between the web server and browsers remains private and integral.

1. **Install Certbot and the Nginx plugin:**

   ```bash
   sudo apt install certbot python3-certbot-nginx
   ```

   - **Explanation**: Certbot is a free, open-source software tool for automatically using Let’s Encrypt certificates on manually-administrated websites.
   - **Source**: [Certbot Official Site](https://certbot.eff.org/)

2. **Obtain an SSL certificate:**

   ```bash
   sudo certbot --nginx -d testsite.com -d www.testsite.com
   ```

   - **Explanation**: This command obtains and installs an SSL certificate for the specified domains by automatically configuring Nginx.
   - **Source**: [Certbot Nginx Documentation](https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx)

3. **Verify SSL renewal:**

   ```bash
   sudo certbot renew --dry-run
   ```

   - **Explanation**: This command tests the automatic renewal process to ensure that your SSL certificates will renew without any issues.
   - **Source**: [Certbot Renewal Documentation](https://certbot.eff.org/docs/using.html#renewing-certificates)

### Step 6: Configure Firewall

**Theoretical Information:**
Configuring a firewall enhances the security of your web server by controlling incoming and outgoing network traffic based on predetermined security rules.

1. **Allow OpenSSH through the firewall:**

   ```bash
   sudo ufw allow OpenSSH
   ```

   - **Explanation**: This command allows SSH connections to your server.
   - **Source**: [UFW Firewall Documentation](https://help.ubuntu.com/community/UFW)

2. **Allow Nginx through the firewall:**

   ```bash
   sudo ufw allow 'Nginx Full'
   ```

   - **Explanation**: This command allows both HTTP (port 80) and HTTPS (port 443) traffic to your Nginx server.
   - **Source**: [UFW Firewall Documentation](https://help.ubuntu.com/community/UFW)

3. **Enable the firewall:**

   ```bash
   sudo ufw enable
   ```

   - **Explanation**: This command enables the UFW firewall to start managing incoming and outgoing traffic.
   - **Source**: [UFW Firewall Documentation](https://help.ubuntu.com/community/UFW)

4. **Check the status of the firewall:**

   ```bash
   sudo ufw status
   ```

   - **Explanation**: This command displays the current status of the firewall and the rules that are in place.
   - **Source**: [UFW Firewall Documentation](https://help.ubuntu.com/community/UFW)

### Step 7: Monitor Nginx

**Theoretical Information:**
Monitoring Nginx helps in tracking its performance and detecting issues. It involves checking access logs, error logs, and other metrics to ensure the server runs smoothly.

1. **Check the access log:**

   ```bash
   sudo tail -f /var/log/nginx/access.log
   ```

   - **Explanation**: This command continuously displays the latest entries in the Nginx access log, showing details of all incoming requests.
   - **Source**: [Nginx Logging](https://nginx.org/en/docs/http/ngx_http_log_module.html)

2. **Check the error log:**

   ```bash
   sudo tail -f /var/log/nginx/error.log
   ```

   - **Explanation**: This command continuously displays the latest entries in the Nginx error log, helping you identify and troubleshoot issues.
   - **Source**: [Nginx Logging](https://nginx.org/en/docs/http/ngx_http_log_module.html)

3. **Install and configure a monitoring tool (Optional):**
   - **Example Tool**: Prometheus and Grafana.
   - **Explanation**: These tools can be used to monitor Nginx performance metrics over time, providing visual dashboards and alerts.
   - **Source**: [Nginx Monitoring with Prometheus and Grafana](https://www.digitalocean.com/community/tutorials/how-to-set-up-prometheus-grafana-and-alertmanager-monitoring-on-ubuntu-20-04)

### Step 8: Optimize Nginx Configuration

**Theoretical Information:**
Optimizing Nginx involves configuring various settings to improve its performance and security.

1. **Enable Gzip compression:**

   ```nginx
   gzip on;
   gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
   ```

   - **Explanation**: This configuration compresses files before sending them to clients, reducing bandwidth usage and improving load times.
   - **Source**: [Nginx Gzip Module](https://nginx.org/en/docs/http/ngx_http_gzip_module.html)

2. **Configure caching:**

   ```nginx
   location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
       expires 365d;
   }
   ```

   - **Explanation**: This configuration sets long expiration times for static assets, reducing the load on the server by caching these files on the client side.
   - **Source**: [Nginx Caching Guide](https://www.digitalocean.com/community/tutorials/how-to-implement-browser-caching-with-nginx-s-header-module-on-ubuntu-16-04)

3. **Limit request rate:**

   ```nginx
   limit_req_zone $binary_remote_addr zone=mylimit:10m rate=10r/s;

   server {
       location / {
           limit_req zone=mylimit burst=20;
       }
   }
   ```

   - **Explanation**: This configuration limits the rate of requests from a single IP address, protecting the server from DoS attacks.
   - **Source**: [Nginx Rate Limiting](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html)

