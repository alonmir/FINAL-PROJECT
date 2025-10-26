FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && pip install --no-cache-dir gunicorn
COPY . .
ENV PORT=5000
EXPOSE 5000
# שים לב: אם האובייקט נקרא אחרת (למשל main:app) – עדכן את "app:app"
CMD ["gunicorn","-w","2","-b","0.0.0.0:5000","app:app"]

