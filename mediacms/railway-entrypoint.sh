#!/bin/bash
# Railway routes the public domain and probes healthchecks on the injected
# $PORT; rewrite nginx's listen directives to follow it.
if [ -n "${PORT:-}" ] && [ "$PORT" != "80" ]; then
  grep -rl 'listen 80' /etc/nginx 2>/dev/null | while read -r f; do
    sed -i "s/listen 80 ;/listen $PORT ;/g; s/listen 80;/listen $PORT;/g" "$f"
  done
fi

exec ./deploy/docker/entrypoint.sh "$@"
