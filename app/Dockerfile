FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=5000
EXPOSE 5000

# מריץ את ה-Flask דרך Python (פשוט ויציב לסביבה שלך)
CMD ["gunicorn","-w","2","-b","0.0.0.0:5000","main:app"]

