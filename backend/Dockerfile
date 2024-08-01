# Base Image
FROM python:3.8.19-slim

# Install netcat
RUN apt-get update && \
    apt-get -y install curl && \
    apt-get clean

# set working directory
WORKDIR /usr/src/backend

# add and install requirements
COPY ./requirements.txt /usr/src/backend/requirements.txt
RUN pip install -r requirements.txt

# add source code
COPY . /usr/src/backend

# run server
CMD ["flask", "run", "--host=0.0.0.0"]