# Dockerfile based on the latest alpine postgres image for the database

FROM postgres:10.2

LABEL maintainer="Anian Ziegler" \
      email="it@sicony.de"       

# Default environment variables for postgres
ENV POSTGRES_DB=sicony

# Install sqitch for database migrations
RUN apt-get update                  \
    && apt-get install sqitch -y    \
    && rm -rf /var/lib/apt/lists/*

# Add the sqitch migrations and configurations
COPY ./ /var/opt/sqitch
WORKDIR /var/opt/sqitch

# Move the files for sqitch into the correct postitions 
# Create a home dir for the postgres user for sqitch to work
RUN mv ./sqitch-container.conf ./sqitch.conf                                \
    && mv -f ./docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/    \
    && mv -f ./docker-entrypoint-upgradedb.d /docker-entrypoint-upgradedb.d \
    && mv -f ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh     \
    && mkdir /home/postgres                                                 \ 
    && chown postgres:postgres /home/postgres

