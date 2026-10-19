FROM mcr.microsoft.com/devcontainers/javascript-node:5-24-bookworm

# Corporate CA (proxy). initializeCommand in devcontainer.json copies the host
# certificates into certs/ before the build.
COPY certs/ /usr/local/share/ca-certificates/
RUN update-ca-certificates

# make_docx.py draws the code figures in Courier New (cour.ttf, courbd.ttf), as
# Windows has it. Debian ships the font in the Microsoft core fonts package of
# contrib. Its installer downloads the fonts while the image builds and only warns
# when the download fails, so the two tests make the build fail instead.
RUN sed -i 's/^Components: main$/Components: main contrib/' /etc/apt/sources.list.d/debian.sources \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/* \
    && test -f /usr/share/fonts/truetype/msttcorefonts/cour.ttf \
    && test -f /usr/share/fonts/truetype/msttcorefonts/courbd.ttf

# uv runs the Python scripts in scripts/ (make_qr.py, make_docx.py).
COPY --from=ghcr.io/astral-sh/uv:0.12.19 /uv /uvx /usr/local/bin/

ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ENV PIP_CERT=/etc/ssl/certs/ca-certificates.crt
