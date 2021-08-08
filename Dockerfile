FROM jboss/wildfly:latest

LABEL author="Pedro Illaisaca"


# Set Postgresql env variables
ENV DB_HOST postgres
ENV DB_PORT 5432
ENV DB_NAME astronet
ENV DB_USER postgres
ENV DB_PASS 12345

ENV DS_NAME pedro
ENV JNDI_NAME java:/pedro

USER root

ADD https://jdbc.postgresql.org/download/postgresql-42.2.4.jar /tmp/postgresql-42.2.4.jar

WORKDIR /tmp
COPY input_files/wildfly-command.sh ./
COPY input_files/module-install.cli ./
# search and replace
RUN sed -i -e 's/\r$//' ./wildfly-command.sh
RUN chmod +x ./wildfly-command.sh
RUN ./wildfly-command.sh \
    &&  rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/

# Download and deploy the war file
ADD CallCenterAstronet.war $JBOSS_HOME/standalone/deployments
VOLUME /opt/jboss/wildfly/standalone/deployments

# Create Wildfly admin user
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

