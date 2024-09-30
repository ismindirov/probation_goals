### Basic Service Management

1. **Start Nginx**:

   ```bash
   sudo systemctl start nginx
   ```

   - Starts the Nginx service.

2. **Stop Nginx**:

   ```bash
   sudo systemctl stop nginx
   ```

   - Stops the Nginx service.

3. **Restart Nginx**:

   ```bash
   sudo systemctl restart nginx
   ```

   - Restarts the Nginx service, useful after making changes to the configuration.

4. **Reload Nginx Configuration**:

   ```bash
   sudo systemctl reload nginx
   ```

   - Reloads the configuration without restarting the service, applying changes smoothly.

5. **Check Nginx Status**:

   ```bash
   sudo systemctl status nginx
   ```

   - Displays the current status of the Nginx service.

6. **Enable Nginx to Start on Boot**:

   ```bash
   sudo systemctl enable nginx
   ```

   - Configures Nginx to start automatically at system boot.

7. **Disable Nginx from Starting on Boot**:

   ```bash
   sudo systemctl disable nginx
   ```

   - Prevents Nginx from starting automatically at system boot.

### Configuration Management

8. **Test Nginx Configuration**:

   ```bash
   sudo nginx -t
   ```

   - Tests the Nginx configuration files for syntax errors.

9. **Test Nginx Configuration with Details**:

   ```bash
   sudo nginx -T
   ```

   - Tests the Nginx configuration and displays detailed output, including all included files.

### Log Management

10. **View Access Logs**:

    ```bash
    tail -f /var/log/nginx/access.log
    ```

    - Displays the latest entries in the access log.

11. **View Error Logs**:

    ```bash
    tail -f /var/log/nginx/error.log
    ```

    - Displays the latest entries in the error log.

### Managing Virtual Hosts

12. **Create a Symbolic Link for a Site**:

    ```bash
    sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
    ```

    - Enables a site configuration by creating a symbolic link.

13. **Remove a Symbolic Link for a Site**:

    ```bash
    sudo rm /etc/nginx/sites-enabled/example.com
    ```

    - Disables a site configuration by removing the symbolic link.

### Security and SSL

14. **Generate a Self-Signed SSL Certificate**:

    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt
    ```

    - Creates a self-signed SSL certificate for testing purposes.

### Managing Nginx with Docker

15. **Run Nginx Docker Container**:

    ```bash
    docker run --name mynginx -d -p 80:80 nginx
    ```

    - Starts an Nginx container using Docker.

16. **Run Nginx Docker Container with Custom Configuration**:

    ```bash
    docker run --name mynginx -d -p 80:80 -v /path/to/nginx.conf:/etc/nginx/nginx.conf nginx
    ```

    - Runs an Nginx container with a custom configuration file.

### Additional Commands

17. **Reload Nginx Using Signal**:

    ```bash
    sudo nginx -s reload
    ```

    - Sends a signal to Nginx to reload the configuration.

18. **Stop Nginx Using Signal**:

    ```bash
    sudo nginx -s stop
    ```

    - Sends a signal to stop Nginx.

19. **Reopen Log Files**:

    ```bash
    sudo nginx -s reopen
    ```

    - Reopens log files (useful after rotating logs).

20. **Upgrade Nginx**:

    ```bash
    sudo apt update && sudo apt upgrade nginx
    ```

    - Upgrades Nginx to the latest version (on Debian-based systems).

21. **Check Nginx Version**:

    ```bash
    nginx -v
    ```

    - Displays the version of Nginx installed.

### Monitoring and Debugging

22. **Check Active Connections**:

    ```bash
    curl -s http://localhost/nginx_status
    ```

    - Displays active connections and other metrics if `stub_status` module is enabled.

### Configuration and Build Information

23. **Show Compile Options**:

    ```bash
    nginx -V
    ```

    - Displays the compile-time options of the Nginx binary.

### Reference and Documentation

24. **Nginx Official Documentation**:
    - Access the [official Nginx documentation](https://nginx.org/en/docs/) for comprehensive guides and references.
