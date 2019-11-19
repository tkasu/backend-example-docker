FROM ubuntu:16.04

ENV FRONT_URL=http://localhost:5000

WORKDIR /app

RUN apt-get update && apt-get -y \ 
    install curl git && \ 
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && \
    git clone https://github.com/tkasu/backend-example-docker.git . && \
    npm install && \
    apt-get purge -y --auto-remove curl git && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m app_user && \
    chown -R app_user .

USER app_user

EXPOSE 8000

CMD npm start
