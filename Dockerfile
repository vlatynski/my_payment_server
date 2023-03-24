FROM python:3.10-alpine

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY . .

EXPOSE 5000
CMD [“python3”, “-m”, “gunicorn”, “-w”, “4”, “-b”, “0.0.0.0:5000”, "--certfile”, “/etc/letsencrypt/live/horoscope.wesselhuising.nl/fullchain.pem”, "--keyfile”, “/etc/letsencrypt/live/horoscope.wesselhuising.nl/privkey.pem”, “app:app”]