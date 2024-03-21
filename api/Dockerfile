FROM python:3.10-slim
WORKDIR /app
COPY ./api/requirements.txt /app
RUN pip3 install -r /app/requirements.txt
COPY ./api /app
EXPOSE 8000

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]