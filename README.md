# AdGuardian-Term Web Terminal

Web-based terminal interface for AdGuard Home monitoring using ttyd and AdGuardian-Term.

## Features

- 🌐 **Web Terminal Interface**: Access AdGuardian-Term through your browser
- 🚀 **Quick Deployment**: One-click deployment with Docker
- 🔒 **Secure Operation**: Runs as non-root user

## Quick Start

### Using Docker Hub Image

```bash
docker run -d \
  -p 7681:7681 \
  -e ADGUARD_IP=your.adguard.ip \
  -e ADGUARD_PORT=80 \
  -e ADGUARD_USERNAME=admin \
  -e ADGUARD_PASSWORD=your_password \
  adguardian-web
```

### Local Build

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
   - The program will automatically detect missing environment variables and prompt for input
   - It's recommended to pre-set all required variables using `-e` parameters

2. **Connection Failed**
   - Check if the AdGuard Home server is accessible
   - Verify IP address and port configuration
   - Confirm username and password are correct

## License

This project is open source under the MIT License.

## Contributing

Issues and Pull Requests are welcome!

## Related Projects

- [AdGuardian-Term](https://github.com/Lissy93/AdGuardian-Term) - Terminal-based AdGuard monitoring tool
- [ttyd](https://github.com/tsl0922/ttyd) - Web-based terminal
