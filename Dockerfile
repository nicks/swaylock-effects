FROM debian:bookworm-slim as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    meson \
    wayland-protocols \
    git \
    pkg-config \
    libwayland-dev \
    libxkbcommon-dev \
    libcairo2-dev \
    libpam0g-dev

ADD . .

RUN meson build
RUN ninja -C build
RUN ninja -C build install

FROM scratch
COPY --from=builder /usr/local/bin/swaylock /swaylock
