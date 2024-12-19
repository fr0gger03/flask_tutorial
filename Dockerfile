# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.12.6
FROM python:${PYTHON_VERSION}-alpine

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

    COPY ./board/ /app/
RUN chown -R appuser:appuser /app  && chmod -R 1777 /app
USER appuser
EXPOSE 8000

CMD [ "python", "-m" , "flask", "run", "--debug", "--port=8000", "--host=0.0.0.0"]

# CMD [ "python", "-m" , "flask", "run", "--port=8000", "--host=0.0.0.0"]