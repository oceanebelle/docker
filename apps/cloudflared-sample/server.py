from flask import Flask
import logging

logger = logging.getLogger('waitress')
logger.setLevel(logging.INFO)

app = Flask(__name__)

@app.route('/') 
def hello_world():   
  logging.info("Hello world here.")
  return "Hello, World! Oceanebelle! Serving on WSGI. With Logging"

if __name__ == '__main__': 
  # waitress is a production WSGI server
  from waitress import serve
  serve(app, host='0.0.0.0', port=8080)