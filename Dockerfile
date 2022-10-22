# Pull base image.
FROM ubuntu:18.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl && \
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs && \
  apt-get install -y default-jre && \
  apt-get install -y default-jdk && \
  apt-get install -y graphviz && \
  rm -rf /var/lib/apt/lists/* && \
  npm i -g c4builder

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Copy local directory to workdir
COPY ./c4_sample .

# Define default command.
CMD [ "bash", "c4builder site" ]