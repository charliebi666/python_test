# base image
FROM alpine:3.5

# Install python and pip
RUN apk update && \
    apk add python3 py3-pip && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache-dir --upgrade pip

# Set working directory
WORKDIR /usr/src/app

# Install requirements
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# copy files to be run
COPY main.py .
COPY routes/templates/base.jinja2 templates/

# port number
EXPOSE 5000

# run app
CMD ["python3", "main.py"]
