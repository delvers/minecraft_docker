FROM alpine
RUN apk add --update bash git openjdk8 && rm -rf /var/cache/apk/*

# build spigot
RUN mkdir /minecraft_build
WORKDIR /minecraft_build
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar /minecraft_build/BuildTools.jar
#RUN /usr/bin/git config --global --unset core.autocrlf
RUN java -jar BuildTools.jar

RUN mkdir -p /minecraft/config
RUN mv /minecraft_build/spigot-1.8.8.jar /minecraft/spigot.jar
WORKDIR /minecraft/config

RUN rm -R /minecraft_build
ADD start.sh /
RUN chmod +x /start.sh

EXPOSE    25565
ENTRYPOINT ["/start.sh"]

