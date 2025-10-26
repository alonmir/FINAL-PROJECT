from flask import Flask, Response
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

REQS = Counter("app_requests_total", "Total HTTP requests")

@app.get("/")
def root():
    REQS.inc()
    return "OK", 200

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

