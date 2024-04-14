from flask import Flask
import json

app = Flask(__name__)

@app.route("/")
def getData():
    with open("termos.json", encoding="UTF-8") as fp:
        return json.load(fp)

if __name__ == "__main__":
    app.run()