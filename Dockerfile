# Base image
FROM openjdk:8-jdk

# Set the working directory
WORKDIR /app

# Copy the app's source code to the container
COPY . /app

# Install Android SDK
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk-tools-linux-4333796.zip -d android-sdk && \
    rm sdk-tools-linux-4333796.zip && \
    yes | android-sdk/tools/bin/sdkmanager --licenses && \
    android-sdk/tools/bin/sdkmanager "platforms;android-29" "build-tools;29.0.3"

# Set environment variables
ENV ANDROID_HOME=/app/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Build the app
RUN ./gradlew assembleDebug

# Expose the port
EXPOSE 8080

# Start the app
CMD ["./gradlew", "installDebug"]
