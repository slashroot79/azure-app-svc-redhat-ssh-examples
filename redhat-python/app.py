
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Root path..."

@app.route('/test')
def test():
    return "Test endpoint..."

