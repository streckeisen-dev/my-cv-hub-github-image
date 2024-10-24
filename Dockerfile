# Use a lightweight Node.js image based on Alpine Linux
FROM node:21-alpine AS base

# Install Java (OpenJDK 21), Python, and other required packages
RUN apk update
RUN apk add --no-cache openjdk21-jdk python3 py3-yaml yarn bash
#RUN pip3 install pyyaml

# Set environment variables for Java (optional)
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

# Verify installations
RUN java -version \
    && node --version \
    && npm --version \
    && yarn --version \
    && python3 --version

# Define the working directory for your project
WORKDIR /workspace

# Copy your project files into the container (useful for build processes)
COPY . .

# Optional: Run your build commands (e.g., npm install, etc.)
# RUN npm install && npm run build

# Default command (can be overridden in your CI/CD pipeline)
CMD ["/bin/bash"]