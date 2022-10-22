# # Pull base image.
# FROM ubuntu:18.04

# # Install.
# RUN \
#   sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
#   apt-get update && \
#   apt-get -y upgrade && \
#   apt-get install -y curl && \
#   curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
#   apt-get install -y nodejs && \
#   apt-get install -y default-jre && \
#   apt-get install -y default-jdk && \
#   apt-get install -y graphviz && \
#   rm -rf /var/lib/apt/lists/* && \
#   npm i -g c4builder

# # Set environment variables.
# ENV HOME /root

# # Define working directory.
# WORKDIR /root

# # Copy local directory to workdir
# COPY ./c4_sample .

# # Define default command.
# CMD [ "/usr/lib/node_modules/c4builder site" ]





FROM openjdk:11

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get update && apt-get install -y nodejs graphviz chromium xvfb

RUN npm i -g c4builder
    
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
#     PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium.sh

CMD /bin/bash -c "c4builder site"