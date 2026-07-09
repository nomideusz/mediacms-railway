FROM mediacms/mediacms:latest

ENV ADMIN_USER=admin \
    ADMIN_EMAIL=admin@example.com \
    POSTGRES_NAME=mediacms \
    POSTGRES_USER=mediacms \
    POSTGRES_PORT=5432

# The Railway volume mounts over media_files, shadowing the default assets the
# image ships there (user avatars, banners). Stash them so the entrypoint can
# seed the volume on first boot.
RUN cp -a /home/mediacms.io/mediacms/media_files /media_files_defaults

COPY railway-entrypoint.sh /railway-entrypoint.sh
RUN chmod +x /railway-entrypoint.sh

ENTRYPOINT ["/railway-entrypoint.sh"]
CMD ["./deploy/docker/start.sh"]
