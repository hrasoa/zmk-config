FROM python:3.10-slim

RUN apt update
RUN apt install pipx -y

RUN pipx install zmk

ENV PATH="/root/.local/bin:$PATH"