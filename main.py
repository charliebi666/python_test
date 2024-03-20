import os.path

from flask import Flask

from routes import router

app = Flask(__name__, template_folder="routes/templates")
app.secret_key = os.getenv("FLASK_SECRET_KEY", "random")

app.register_blueprint(router)
#
if __name__ == '__main__':
    app.run(port=os.getenv("FLASK_PORT", 5000))

