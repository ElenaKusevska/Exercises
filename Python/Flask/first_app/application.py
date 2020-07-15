from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return("Hello, world! take two")

@app.route("/<string:name>")
def hello(name):
    name1 = name.capitalize()
    return f"<h1> Hello, {name1}! </h1>"