FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl supervisor logrotate
RUN cd /tmp \

	&& curl -OL https://cloud.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent_5.6.0.364-1_amd64.ubuntu1604.deb \
	&& dpkg -i mongodb-mms-monitoring-agent_5.6.0.364-1_amd64.ubuntu1604.deb \

	&& curl -OL https://cloud.mongodb.com/download/agent/backup/mongodb-mms-backup-agent_5.3.0.484-1_amd64.ubuntu1604.deb \
	&& dpkg -i mongodb-mms-backup-agent_5.3.0.484-1_amd64.ubuntu1604.deb


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENV MMS_API_KEY=KEY

ENTRYPOINT ["/startup.sh"]

CMD ["supervisord"]