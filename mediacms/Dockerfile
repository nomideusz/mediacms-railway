# Docker Hub has no MediaCMS version tags past 7.2.0; this digest is `latest` built
# 2026-10-20 (MediaCMS 9.3.1). Bump by copying the new `latest` digest.
FROM mediacms/mediacms@sha256:f10737c9cd23836969680db9c5ee5aec8d2b7e09b559aa8ad93cf2460ec81a7e

ENV ADMIN_USER=admin \
    ADMIN_EMAIL=admin@example.com \
    POSTGRES_NAME=mediacms \
    POSTGRES_USER=mediacms \
    POSTGRES_PORT=5432

# Upstream's .dockerignore excludes media_files/** from the image (their
# compose mounts the cloned repo over the app dir instead), so the default
# avatar/banner assets are missing. Fetch them so the entrypoint can seed the
# volume on first boot.
ADD https://raw.githubusercontent.com/mediacms-io/mediacms/main/media_files/userlogos/user.jpg /media_files_defaults/userlogos/user.jpg
ADD https://raw.githubusercontent.com/mediacms-io/mediacms/main/media_files/userlogos/banner.jpg /media_files_defaults/userlogos/banner.jpg
ADD https://raw.githubusercontent.com/mediacms-io/mediacms/main/media_files/userlogos/poster_audio.jpg /media_files_defaults/userlogos/poster_audio.jpg
RUN chmod -R a+r /media_files_defaults

COPY railway-entrypoint.sh /railway-entrypoint.sh
RUN chmod +x /railway-entrypoint.sh

ENTRYPOINT ["/railway-entrypoint.sh"]
CMD ["./deploy/docker/start.sh"]
