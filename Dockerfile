FROM python:3.9-slim

RUN pip install --upgrade pip

# Install libraries
COPY ./requirements.txt ./

RUN pip install -r requirements.txt && \
    rm ./requirements.txt

# Setup container directories
RUN mkdir /app

# Copy local code to the container
COPY . .
# launch server with gunicorn
WORKDIR /app

EXPOSE 8080

CMD python3 main.py
