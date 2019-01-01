#!/bin/sh

DOCLET_VERSION="1.0.0"
SPIGOT_REV="1.13.2"

# Create temp directory & cd into it
mkdir temp
cd temp

# Download BuildTools
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Run BuildTools
java -jar BuildTools.jar --rev $SPIGOT_REV

# Download the JSON doclet
wget https://github.com/InventivetalentDev/jsondoclet/releases/download/v$DOCLET_VERSION/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar

# cd back out of the temp directory
cd ..

# Run Doclet
javadoc -docletpath ./temp/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar -doclet org.inventivetalent.jsondoclet.JsonDoclet -outfile ../jjdoc/$SPIGOT_REV/ -sourcepath ./temp/Spigot/Spigot-API/src/main/java -public -subpackages org.bukkit:org.spigotmc