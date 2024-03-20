# base image
FROM python:3.10-slim

# Set working directory
WORKDIR /usr/src/app

# Install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy files to be run
COPY main.py .
COPY test_app.py .
COPY routes/templates/base.jinja2 templates/

# port number
EXPOSE 5000

# run app
CMD ["python", "main.py"]
