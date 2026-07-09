#!/bin/bash
# Railway routes the public domain and probes healthchecks on the injected
# $PORT; rewrite nginx's listen directives to follow it.
if [ -n "${PORT:-}" ] && [ "$PORT" != "80" ]; then
  # Patch both the live confs and the deploy/docker sources — the image's
  # entrypoint copies the latter over /etc/nginx after this script runs.
  grep -rl 'listen 80' /etc/nginx /home/mediacms.io/mediacms/deploy/docker 2>/dev/null | while read -r f; do
    sed -i "s/listen 80 ;/listen $PORT ;/g; s/listen 80;/listen $PORT;/g" "$f"
  done
fi

exec ./deploy/docker/entrypoint.sh "$@"
