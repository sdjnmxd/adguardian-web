# Use Ubuntu 22.04 which has ttyd in package manager
FROM ubuntu:22.04

# Install ttyd and dependencies from package manager
RUN apt-get update && \
    apt-get install -y \
    ttyd \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Download pre-compiled AdGuardian-Term binary
RUN curl -L -o /usr/local/bin/adguardian \
    https://github.com/Lissy93/AdGuardian-Term/releases/download/1.6.0/adguardian-x86_64 && \
    chmod +x /usr/local/bin/adguardian

# Copy startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Create non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 7681

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:7681/ || exit 1

# Start ttyd
CMD ["ttyd", "/usr/local/bin/start.sh"]
