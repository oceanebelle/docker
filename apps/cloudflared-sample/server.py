from flask import Flask

app = Flask(__name__)

@app.route('/') 
def hello_world(): 
  return "Hello, World! Oceanebelle! Serving on WSGI"

if __name__ == '__main__': 
  # waitress is a production WSGI server
  from waitress import serve
  serve(app, host='0.0.0.0', port=8080)