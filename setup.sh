#!/bin/sh

API_URL="https://papermc.io/api/v1"

if [ -n "$MINECRAFT_VERSION" ]; then
  echo "Minecraft version is required."
  exit 1
fi

mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"

if ! [ -f "$PROJECT_NAME-$PAPERMC_VERSION.jar" ]; then
  wget "$API_URL/$PROJECT_NAME/$MINECRAFT_VERSION/$PAPERMC_VERSION/download" -O "$PROJECT_NAME-$PAPERMC_VERSION.jar"
fi

if ! [ -f "eula.txt" ]; then
  echo "true" > "eula.txt"
fi

java "-Xmx$RAM" "-Xms$RAM" "$JAVA_OPTS" -jar "$PROJECT_NAME-$PAPERMC_VERSION.jar" --nogui
