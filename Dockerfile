FROM lsiobase/kasmvnc:ubuntunoble

# Install dependencies for WeChat
RUN apt-get update && \
    apt-get install -y \
        wget \
        zstd \
        xdg-utils \
        libxcb-xinerama0 \
        libxcb-cursor0 \
        fonts-noto-cjk-extra \
        libxkbcommon-x11-0 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-shape0 \
        libxcb-render-util0 \
        libxcb-keysyms1 \
        libnss3 \
        libatomic1 \
        libatk-bridge2.0-dev \
        libatk1.0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install WeChat
RUN wget https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb -O /tmp/wechat.deb && \
    apt-get install -y /tmp/wechat.deb && \
    rm /tmp/wechat.deb


# Create a config directory to be mounted
RUN mkdir -p /config/.local/share

# Copy autostart file to launch WeChat automatically
COPY ./root /

EXPOSE 3000
