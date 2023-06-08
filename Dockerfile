FROM alpine:latest

ENV TIMEZONE Europe/Paris

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app

VOLUME /app

RUN adduser -D dwb

VOLUME /home/dwb/.ssh

EXPOSE 80 8000 3000 8080 443 3306

RUN apk add --no-cache git npm composer nano openssh
RUN ssh-keygen -A

COPY /scripts/* /dwb/scripts/
COPY /config/* /dwb/config/

# RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
# RUN sed -i "s/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g" /etc/ssh/sshd_config

RUN echo "ssh is open at :" $(hostname -i)
RUN echo "port :" $(cat /etc/ssh/sshd_config | grep -E '#Port\s(\d.*)' | tail -n 1 | awk '{print $2}')

RUN chmod +x /dwb/scripts/*
# ENTRYPOINT ["/dwb/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]

