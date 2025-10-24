# AdGuardian-Term Web Terminal

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-sdjnmxd%2Fadguardian--web-blue?logo=docker)](https://hub.docker.com/r/sdjnmxd/adguardian-web)
[![GitHub](https://img.shields.io/badge/GitHub-sdjnmxd%2Fadguardian--web-black?logo=github)](https://github.com/sdjnmxd/adguardian-web)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

> **⚠️ Important Notice**: This is a **third-party project** and is **not officially maintained** by the AdGuardian-Term team. This project provides a web-based interface for AdGuardian-Term using ttyd, but it's maintained independently.

Web-based terminal interface for AdGuard Home monitoring using ttyd and AdGuardian-Term. This project wraps the excellent [AdGuardian-Term](https://github.com/Lissy93/AdGuardian-Term) in a Docker container with ttyd to provide web access through your browser.

### What This Project Does

This is essentially a Docker wrapper that:
1. **Packages AdGuardian-Term**: Downloads the latest AdGuardian-Term binary
2. **Adds Web Interface**: Uses ttyd to provide web terminal access
3. **Simplifies Deployment**: One Docker command to get everything running
4. **Handles Configuration**: Smart error messages and environment variable validation

### Why Use This Instead of Building Yourself?

- **No Build Required**: Pre-built image available on Docker Hub
- **Always Updated**: Uses the latest AdGuardian-Term release
- **Optimized**: Lightweight Ubuntu base with minimal dependencies
- **Secure**: Runs as non-root user with health checks
- **User-Friendly**: Clear error messages and configuration guidance

## Features

- 🌐 **Web Terminal Interface**: Access AdGuardian-Term through your browser
- 🚀 **Quick Deployment**: One-click deployment with Docker
- 🔒 **Secure Operation**: Runs as non-root user
- 📦 **Pre-built Image**: Available on Docker Hub, no building required

## Quick Start

### Using Docker Hub Image

> **📦 Docker Hub**: [sdjnmxd/adguardian-web](https://hub.docker.com/r/sdjnmxd/adguardian-web)  
> **📚 Source Code**: [GitHub Repository](https://github.com/sdjnmxd/adguardian-web)

```bash
docker run -d \
  -p 7681:7681 \
  -e ADGUARD_IP=your.adguard.ip \
  -e ADGUARD_PORT=80 \
  -e ADGUARD_USERNAME=admin \
  -e ADGUARD_PASSWORD=your_password \
  sdjnmxd/adguardian-web
```

### Local Build

> **📚 Source Code**: [GitHub Repository](https://github.com/sdjnmxd/adguardian-web)

```bash
# Clone repository
git clone https://github.com/sdjnmxd/adguardian-web.git
cd adguardian-web

# Build image
docker build -t adguardian-web .

# Run container
docker run -d \
  -p 7681:7681 \
  -e ADGUARD_IP=192.168.1.1 \
  -e ADGUARD_PORT=80 \
  -e ADGUARD_USERNAME=admin \
  -e ADGUARD_PASSWORD=password \
  adguardian-web
```

## Environment Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `ADGUARD_IP` | AdGuard Home server IP address | ✅ | - |
| `ADGUARD_PORT` | AdGuard Home server port | ✅ | - |
| `ADGUARD_USERNAME` | AdGuard Home username | ✅ | - |
| `ADGUARD_PASSWORD` | AdGuard Home password | ✅ | - |
| `ADGUARD_PROTOCOL` | Connection protocol | ❌ | http |
| `ADGUARD_UPDATE_INTERVAL` | Refresh interval (seconds) | ❌ | 2 |

## Access Interface

After starting the container, access it in your browser:

```
http://localhost:7681
```

## Technical Architecture

- **Base Image**: Ubuntu 22.04
- **Web Terminal**: ttyd 1.6.3
- **Monitoring Tool**: AdGuardian-Term 1.6.0
- **Runtime User**: Non-root user

## Troubleshooting

### Common Issues

1. **Missing Environment Variables**
   - The application will automatically detect missing environment variables and display helpful error messages
   - You'll see a clear list of missing variables and usage examples
   - It's recommended to pre-set all required variables using `-e` parameters

2. **Connection Failed**
   - Check if the AdGuard Home server is accessible
   - Verify IP address and port configuration
   - Confirm username and password are correct

3. **Web Interface Not Loading**
   - Ensure port 7681 is not blocked by firewall
   - Check if another service is using port 7681
   - Try accessing `http://localhost:7681` (not https)

4. **Container Keeps Restarting**
   - Check container logs: `docker logs <container_name>`
   - Verify all required environment variables are set
   - Ensure AdGuard Home server is reachable from the container

5. **Permission Issues**
   - The container runs as non-root user for security
   - If you need to modify files, use `docker exec -it <container_name> /bin/bash`

### Getting Help

- **Docker Issues**: Check [Docker documentation](https://docs.docker.com/)
- **AdGuard Home Issues**: Visit [AdGuard Home documentation](https://github.com/AdguardTeam/AdGuardHome)
- **This Project Issues**: Create an issue in this repository
- **AdGuardian-Term Issues**: Create an issue in the [official repository](https://github.com/Lissy93/AdGuardian-Term)

## License

This project is open source under the MIT License.

## Support & Issue Reporting

### 🐛 Where to Report Issues

**Report issues to THIS repository (`sdjnmxd/adguardian-web`) if:**
- Docker container fails to start
- Web interface doesn't load
- Environment variable configuration problems
- ttyd-related issues
- Docker image build problems
- This project's documentation issues

**Report issues to the OFFICIAL repository ([Lissy93/AdGuardian-Term](https://github.com/Lissy93/AdGuardian-Term)) if:**
- AdGuardian-Term application crashes
- AdGuard Home API connection issues
- Data display problems in the terminal interface
- Core AdGuardian-Term functionality bugs
- Feature requests for AdGuardian-Term itself

### 🤝 Contributing

Issues and Pull Requests are welcome! Please make sure to:
- Check existing issues before creating new ones
- Provide clear reproduction steps for bugs
- Include your Docker version and system information
- Test your changes thoroughly

## Related Projects

- [AdGuardian-Term](https://github.com/Lissy93/AdGuardian-Term) - The original terminal-based AdGuard monitoring tool
- [ttyd](https://github.com/tsl0922/ttyd) - Web-based terminal that powers this project
- [AdGuard Home](https://github.com/AdguardTeam/AdGuardHome) - The DNS server this tool monitors

## Links & Resources

- **🐳 Docker Hub**: [sdjnmxd/adguardian-web](https://hub.docker.com/r/sdjnmxd/adguardian-web)
- **📚 GitHub Repository**: [sdjnmxd/adguardian-web](https://github.com/sdjnmxd/adguardian-web)
- **📋 Issues & Support**: [GitHub Issues](https://github.com/sdjnmxd/adguardian-web/issues)
- **📄 License**: [MIT License](https://opensource.org/licenses/MIT)
