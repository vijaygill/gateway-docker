FROM python:3.11-slim-bullseye

SHELL ["/bin/bash", "-ec"]

RUN apt update && apt install --no-install-recommends -y bluez build-essential git
RUN python3 -m venv /opt/venv && \
        source /opt/venv/bin/activate && \
        pip install --no-cache-dir --upgrade pip && \
	pip install --no-cache-dir --upgrade --extra-index-url=https://www.piwheels.org/simple pip TheengsGateway

#RUN pip install --no-cache-dir --upgrade git+https://github.com/theengs/gateway.git

COPY chroot /
CMD source /opt/venv/bin/activate && exec /opt/venv/start.sh
