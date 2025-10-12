#!/usr/bin/env sh

PROJECT="paper"
MINECRAFT_VERSION="1.21.10"
USER_AGENT="RaspberryPiGuide/1.0.0 (RaspberryPiGuide@gmail.com)"

# First check if the version exists
VERSION_CHECK=$(curl -s -H "User-Agent: $USER_AGENT" https://fill.papermc.io/v3/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds)

# Check if the API returned an error
if echo "$VERSION_CHECK" | jq -e '.ok == false' > /dev/null 2>&1; then
  ERROR_MSG=$(echo "$VERSION_CHECK" | jq -r '.message // "Unknown error"')
  echo "Error: $ERROR_MSG"
  exit 1
fi

# Get the download URL directly, or null if no stable build exists
PAPERMC_URL=$(curl -s -H "User-Agent: $USER_AGENT" https://fill.papermc.io/v3/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds | \
  jq -r 'first(.[] | select(.channel == "STABLE") | .downloads."server:default".url) // "null"')

if [ "$PAPERMC_URL" != "null" ]; then
  # Download the latest Paper version
  curl -o server.jar $PAPERMC_URL
  echo "Download completed"
else
  echo "No stable build for version $MINECRAFT_VERSION found :("
fi
