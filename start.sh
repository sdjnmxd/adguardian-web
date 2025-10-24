#!/bin/bash

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
        echo "❌ Error: Missing required environment variables:"
        for var in "${missing_vars[@]}"; do
            echo "   - $var"
        done
        echo ""
        echo "Please set the following environment variables:"
        echo "  ADGUARD_IP       - AdGuard Home server IP address"
        echo "  ADGUARD_PORT     - AdGuard Home server port"
        echo "  ADGUARD_USERNAME - AdGuard Home username"
        echo "  ADGUARD_PASSWORD - AdGuard Home password"
        echo ""
        echo "Optional environment variables:"
        echo "  ADGUARD_PROTOCOL         - Connection protocol (default: http)"
        echo "  ADGUARD_UPDATE_INTERVAL  - Refresh interval in seconds (default: 2)"
        echo ""
        echo "Example:"
        echo "  docker run -d -p 7681:7681 \\"
        echo "    -e ADGUARD_IP=192.168.1.1 \\"
        echo "    -e ADGUARD_PORT=80 \\"
        echo "    -e ADGUARD_USERNAME=admin \\"
        echo "    -e ADGUARD_PASSWORD=your_password \\"
        echo "    sdjnmxd/adguardian-web"
        echo ""
        echo "Press any key to exit..."
        read -n 1
        exit 1
    fi
}

# Display configuration information
show_config() {
    echo "🚀 Starting AdGuardian Web Terminal..."
    echo "📡 Connecting to AdGuard Home:"
    echo "   IP: $ADGUARD_IP"
    echo "   Port: $ADGUARD_PORT"
    echo "   Protocol: ${ADGUARD_PROTOCOL:-http}"
    echo "   Username: $ADGUARD_USERNAME"
    echo "   Update Interval: ${ADGUARD_UPDATE_INTERVAL:-2} seconds"
    echo ""
}

# Main function
main() {
    # Check environment variables
    check_env
    
    # Display configuration information
    show_config
    
    # Start AdGuardian-Term
    echo "🔄 Starting AdGuardian-Term..."
    exec /usr/local/bin/adguardian
}

# Run main function
main
