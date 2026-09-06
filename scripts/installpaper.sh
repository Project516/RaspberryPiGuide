#!/usr/bin/env sh

PROJECT="paper"
USER_AGENT="very-cool-project/1.0.0 (goaway@me.com)"

# Get all versions for the project
# The versions are organized by version group, so we need to extract all versions from all groups
# Then sort them properly as semantic versions (newest first)
VERSIONS=$(curl -s -H "User-Agent: $USER_AGENT" https://fill.papermc.io/v3/projects/${PROJECT} | \
  jq -r '.versions | to_entries[] | .value[]' | \
  sort -V -r)

if [ -z "$VERSIONS" ]; then
  echo "Error: could not fetch version list from PaperMC"
  exit 1
fi

# Iterate through versions to find the latest one with a stable build
PAPERMC_URL="null"
FOUND_VERSION=""
for VERSION in $VERSIONS; do
  VERSION_BUILDS=$(curl -s -H "User-Agent: $USER_AGENT" https://fill.papermc.io/v3/projects/${PROJECT}/versions/${VERSION}/builds)

  # Check if this version has a stable build
  STABLE_URL=$(echo "$VERSION_BUILDS" | jq -r 'first(.[] | select(.channel == "STABLE") | .downloads."server:default".url) // "null"')

  if [ "$STABLE_URL" != "null" ]; then
    PAPERMC_URL="$STABLE_URL"
    FOUND_VERSION="$VERSION"
    echo "Found stable build for version $VERSION"
    break
  fi
done

if [ "$PAPERMC_URL" != "null" ]; then
  # Download the latest Paper version with a stable build
  curl -o server.jar $PAPERMC_URL
  echo "Download completed (version: $FOUND_VERSION)"
else
  echo "No stable builds available for any version :("
  exit 1
fi
