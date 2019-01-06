#!/bin/sh

### First "git clone https://github.com/InventivetalentDev/jjdoc-spigot.git"
### cd scripts

DOCLET_VERSION="1.0.2"
SPIGOT_REV="1.13.2"

# Create temp directory & cd into it
mkdir temp
cd temp

# Download BuildTools
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Run BuildTools
java -jar BuildTools.jar --rev $SPIGOT_REV

# Download the JSON doclet
wget https://github.com/InventivetalentDev/jsondoclet/releases/download/$DOCLET_VERSION-SNAPSHOT/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar

# cd back out of the temp directory
cd ..

# Run Doclet in index mode
javadoc -docletpath ./temp/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar -doclet org.inventivetalent.jsondoclet.JsonDoclet -outfile ../jjdoc/$SPIGOT_REV/ -sourcepath ./temp/Spigot/Spigot-API/src/main/java -public -subpackages org.bukkit:org.spigotmc
# Run Doclet in single-file mode
javadoc -docletpath ./temp/json-doclet-$DOCLET_VERSION-SNAPSHOT-jar-with-dependencies.jar -doclet org.inventivetalent.jsondoclet.JsonDoclet -singlefile -outfile ../jjdoc/spigot-$SPIGOT_REV.json -sourcepath ./temp/Spigot/Spigot-API/src/main/java -public -subpackages org.bukkit:org.spigotmc


## Final cleanup
rm -Rf temp

### Then cd ..
### git add jjdoc && git commit && git push
