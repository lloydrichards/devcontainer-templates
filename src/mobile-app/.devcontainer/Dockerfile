FROM --platform=linux/amd64 ubuntu:focal

# Set environment variables
ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk

ENV FLUTTER_SDK_ROOT=/usr/lib/flutter

# Include flutter and android tools in path
ENV PATH="${PATH}:${FLUTTER_SDK_ROOT}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools"

# Enable noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    watchman \
    openjdk-17-jdk \
    android-sdk \
    wget \
    unzip \
    zip \
    curl \
    git-all \
    xz-utils \
    libglu1-mesa \
    libbz2-1.0 \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    mesa-utils \
    ca-certificates \
    gnupg && \
    rm -rf /var/lib/apt/lists/*

# Add flutter to safe directory in git
RUN git config --global --add safe.directory /usr/lib/flutter

# Configure git user name and email
RUN git config --global user.name "Your Name" \
    && git config --global user.email "mail@example.com"

# Download and install Android Command Line Tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget -O commandlinetools.zip "https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip" && \
    unzip commandlinetools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/latest && \
    rm commandlinetools.zip

# Accept Android SDK licenses and install necessary components
RUN yes | ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --licenses && \
    ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-36" "build-tools;28.0.3"

# Install Google Chrome for Flutter web
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-linux-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Install Flutter SDK (latest stable)
RUN git clone --branch stable --depth 1 https://github.com/flutter/flutter.git ${FLUTTER_SDK_ROOT}

# Disable Flutter telemetry
RUN flutter --disable-analytics

# Default shell to bash
SHELL ["/bin/bash", "-c"]
