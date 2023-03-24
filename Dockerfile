FROM python:bullseye

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY . .

EXPOSE 5000
CMD ["python", "-m", "gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "--certfile", "/etc/letsencrypt/live/uniqueyou.online/fullchain.pem", "--keyfile", "/etc/letsencrypt/live/uniqueyou.online/privkey.pem", "app:app"]