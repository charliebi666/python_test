# base image
FROM alpine:3.5

# Install python and pip
RUN apk add -- update python3-pip

# Install requirements
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files to be run
COPY main.py /usr/src/app/
COPY routes/templates/base.jinja2 /usr/src/app/templates/

# port number
EXPOSE 5000

# run app
CMD ["python", "usr/src/app/app.py"]
