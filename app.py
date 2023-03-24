from flask import Flask
from flask_talisman import Talisman
 
app = Flask(__name__)
Talisman(app, content_security_policy=None)
 
@app.route('/')
def index():
    return 'Hello to Flask!'
 
# main driver function
if __name__ == "__main__":
    app.run()