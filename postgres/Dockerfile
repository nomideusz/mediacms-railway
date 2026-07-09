FROM postgres:17-alpine

# PGDATA one level below the mount: Railway volumes arrive with lost+found,
# which initdb refuses to initialize into.
ENV POSTGRES_USER=mediacms \
    POSTGRES_DB=mediacms \
    PGDATA=/var/lib/postgresql/data/pgdata
