FROM python:3.11.0-slim
WORKDIR /app
RUN pip install --upgrade pip
COPY . .
RUN pip install -r requirement.txt
