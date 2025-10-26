from flask import Flask

app = Flask(__name__)

@app.get("/")
def root():
    return "OK", 200

if __name__ == "__main__":
    # מאזין החוצה על 0.0.0.0:5000
    app.run(host="0.0.0.0", port=5000)

