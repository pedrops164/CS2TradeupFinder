# Base Image
FROM python:3.10-slim

WORKDIR /backend

# add and install requirements
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

# add source code
COPY app app
COPY migrations migrations
COPY src src
COPY config.py project.py ./

#EXPOSE 5000

# run server
CMD ["waitress-serve", "--port=5000", "--url-scheme=https", "project:app"]