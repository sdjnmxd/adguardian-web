#!/bin/bash

# AdGuardian-Term Web Terminal Entrypoint Script
# This is a third-party project that provides web access to AdGuardian-Term
# Official AdGuardian-Term: https://github.com/Lissy93/AdGuardian-Term
# This project: https://github.com/sdjnmxd/adguardian-web

# Display welcome message
show_welcome() {
    echo "=========================================="
    echo "🌐 AdGuardian-Term Web Terminal"
    echo "=========================================="
    echo "📋 This is a third-party project"
    echo "🔗 Official AdGuardian-Term: https://github.com/Lissy93/AdGuardian-Term"
    echo "🐛 Issues with this web version: https://github.com/sdjnmxd/adguardian-web"
    echo "🐛 Issues with AdGuardian-Term itself: https://github.com/Lissy93/AdGuardian-Term"
    echo "=========================================="
    echo ""
}

# Check required environment variables
check_env() {
    local missing_vars=()
    
    if [ -z "$ADGUARD_IP" ]; then
        missing_vars+=("ADGUARD_IP")
    fi
    
    if [ -z "$ADGUARD_PORT" ]; then
        missing_vars+=("ADGUARD_PORT")
    fi
    
    if [ -z "$ADGUARD_USERNAME" ]; then
        missing_vars+=("ADGUARD_USERNAME")
    fi
    
    if [ -z "$ADGUARD_PASSWORD" ]; then
        missing_vars+=("ADGUARD_PASSWORD")
    fi
    
    if [ ${#missing_vars[@]} -gt 0 ]; then
        echo "❌ Configuration Error: Missing required environment variables"
        echo ""
        echo "Missing variables:"
        for var in "${missing_vars[@]}"; do
            echo "   - $var"
        done
        echo ""
        echo "📋 Required environment variables:"
        echo "  ADGUARD_IP       - AdGuard Home server IP address (e.g., 192.168.1.1)"
        echo "  ADGUARD_PORT     - AdGuard Home server port (usually 80 or 443)"
        echo "  ADGUARD_USERNAME - AdGuard Home admin username"
        echo "  ADGUARD_PASSWORD - AdGuard Home admin password"
        echo ""
        echo "📋 Optional environment variables:"
        echo "  ADGUARD_PROTOCOL         - Connection protocol (default: http)"
        echo "  ADGUARD_UPDATE_INTERVAL  - Refresh interval in seconds (default: 2)"
        echo ""
        echo "🚀 Quick Start Example:"
        echo "  docker run -d -p 7681:7681 \\"
        echo "    -e ADGUARD_IP=192.168.1.1 \\"
        echo "    -e ADGUARD_PORT=80 \\"
        echo "    -e ADGUARD_USERNAME=admin \\"
        echo "    -e ADGUARD_PASSWORD=your_password \\"
        echo "    sdjnmxd/adguardian-web"
        echo ""
        echo "🌐 After starting, access the web interface at: http://localhost:7681"
        echo ""
        echo "📚 For more help:"
        echo "  - This project: https://github.com/sdjnmxd/adguardian-web"
        echo "  - AdGuardian-Term: https://github.com/Lissy93/AdGuardian-Term"
        echo "  - AdGuard Home: https://github.com/AdguardTeam/AdGuardHome"
        echo ""
        echo "Press any key to exit..."
        read -n 1
        exit 1
    fi
}

# Display configuration information
show_config() {
    echo "🚀 Starting AdGuardian Web Terminal..."
    echo "📡 Configuration:"
    echo "   🌐 AdGuard Home Server: ${ADGUARD_PROTOCOL:-http}://$ADGUARD_IP:$ADGUARD_PORT"
    echo "   👤 Username: $ADGUARD_USERNAME"
    echo "   ⏱️  Update Interval: ${ADGUARD_UPDATE_INTERVAL:-2} seconds"
    echo ""
    echo "🌐 Web Interface will be available at: http://localhost:7681"
    echo "📋 This is a third-party project - for issues:"
    echo "   - Web/Docker issues: https://github.com/sdjnmxd/adguardian-web"
    echo "   - AdGuardian-Term issues: https://github.com/Lissy93/AdGuardian-Term"
    echo ""
}

# Main function
main() {
    # Show welcome message
    show_welcome
    
    # Check environment variables
    check_env
    
    # Display configuration information
    show_config
    
    # Start ttyd with AdGuardian-Term
    echo "🔄 Starting ttyd with AdGuardian-Term..."
    echo "⏳ Please wait while the web interface initializes..."
    echo ""
    exec ttyd /usr/local/bin/adguardian
}

# Run main function
main
