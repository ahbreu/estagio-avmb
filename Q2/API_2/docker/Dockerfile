FROM python:3.12-alpine

WORKDIR /app

COPY API /app/

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]