# Deploy and Host MediaCMS on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/mediacms?referralCode=sLjDXb&utm_medium=integration&utm_source=button&utm_campaign=mediacms)

[MediaCMS](https://mediacms.io/) is a modern, open-source video and media platform: upload videos, transcode them automatically to multiple resolutions with HLS adaptive streaming, organize with playlists, categories and tags, and manage users — a self-hosted alternative to hosted video platforms, built on Django and React.

## Screenshots

![MediaCMS home feed](https://raw.githubusercontent.com/two-workspaces/mediacms/main/images/01.png)

![MediaCMS video player with chapters](https://raw.githubusercontent.com/two-workspaces/mediacms/main/images/02.jpg)

![MediaCMS dark mode player with up-next sidebar](https://raw.githubusercontent.com/two-workspaces/mediacms/main/images/04.jpg)

## About Hosting MediaCMS

This template runs MediaCMS as three Railway services: the main all-in-one container (web UI, API, nginx, and the celery transcoding workers sharing one volume for media files — no shared-storage juggling), PostgreSQL, and Redis as the task broker. On first boot it runs database migrations and creates your admin account from the `ADMIN_PASSWORD` variable (username `admin`). Videos transcode on CPU via ffmpeg with progressive MP4 and HLS output. Media files persist on the attached volume; scale the volume with your library.

## Common Use Cases

- Personal or community video platform with automatic multi-resolution transcoding
- Internal video portal for courses, trainings, or company media
- Ad-free archive for creators who want to own their distribution

## Dependencies for MediaCMS Hosting

- All bundled: PostgreSQL 17 and Redis are provisioned by the template

### Deployment Dependencies

- [MediaCMS documentation](https://docs.mediacms.io/)
- [Template source on GitHub](https://github.com/two-workspaces/mediacms)

### Implementation Details

**Your MediaCMS URL is the `mediacms` service's domain.** Sign in with username `admin` and the `ADMIN_PASSWORD` variable's value (auto-generated — find it in the service's variables), then change it in your profile.

Notes and limits:

- **Transcoding is CPU-only** (Railway has no GPU) — expect roughly real-time or slower encodes for HD content; fine for typical libraries, slow for bulk 4K ingestion.
- Media lives on the service volume at `media_files`; volume size is plan-dependent on Railway, so check your plan's cap against your library size.
- Redis is intentionally ephemeral (matching upstream): a restart loses only queued-but-unstarted encode jobs, which can be re-triggered from the admin.
- To customize portal name, workflow, or other settings, add MediaCMS environment variables (e.g. `PORTAL_NAME`) to the `mediacms` service.

## Why Deploy MediaCMS on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying MediaCMS on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
