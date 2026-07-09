FROM mediacms/mediacms:latest

ENV ADMIN_USER=admin \
    ADMIN_EMAIL=admin@example.com \
    POSTGRES_NAME=mediacms \
    POSTGRES_USER=mediacms \
    POSTGRES_PORT=5432

COPY railway-entrypoint.sh /railway-entrypoint.sh
RUN chmod +x /railway-entrypoint.sh

ENTRYPOINT ["/railway-entrypoint.sh"]
CMD ["./deploy/docker/start.sh"]
