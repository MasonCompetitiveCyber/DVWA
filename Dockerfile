FROM tutum/lamp

ENV VERSION 1.9


RUN rm -rf /app && \
    apt update && \
    apt install -y wget && \
    rm -rf /var/lib/apt/lists/*

ADD app/ /app

RUN cp /app/config/config.inc.php.dist /app/config/config.inc.php
RUN ls /app
RUN wget https://raw.githubusercontent.com/infoslack/docker-dvwa/master/conf/setup_dvwa.sh
RUN chmod +x setup_dvwa.sh
RUN ./setup_dvwa.sh

EXPOSE 80 3306
CMD ["/run.sh"]
