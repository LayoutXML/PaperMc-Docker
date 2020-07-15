#!/bin/sh

API_URL="https://papermc.io/api/v1"

#Setup environment and validate inputs
mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"

if ! [ -f "eula.txt" ]; then
  echo "true" > "eula.txt"
fi

if [ -z $MINECRAFT_VERSION ]; then
  echo "Minecraft version is required."
  exit 1
fi

#Download jar file
if [[ "$PAPERMC_VERSION" == "latest" || ! -f "$PROJECT_NAME-$PAPERMC_VERSION.jar" ]]; then
  wget "$API_URL/$PROJECT_NAME/$MINECRAFT_VERSION/$PAPERMC_VERSION/download" -O "$PROJECT_NAME-$PAPERMC_VERSION.jar"
fi

echo "Starting server with following options:"
echo -e "JDK_VERSION:\t$JDK_VERSION"
echo -e "FOLDER_NAME:\t$FOLDER_NAME"
echo -e "PROJECT_NAME\t$PROJECT_NAME"
echo -e "MINECRAFT_VERSION:\t$MINECRAFT_VERSION"
echo -e "PAPERMC_VERSION:\t$PAPERMC_VERSION"
echo -e "RAM:\t$RAM"
echo -e "JAVA_ARGS:\t$JAVA_ARGS"

java "-Xmx$RAM" "-Xms$RAM" "$JAVA_OPTS" -jar "$PROJECT_NAME-$PAPERMC_VERSION.jar" --nogui
