from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    print("Creating Flask app")
    app = Flask(_name_)
    app.config.from_object('config.Config')

    print("Initializing database")
    db.init_app(app)

    with app.app_context():
        print("Importing views and models")
        from . import models
        from .views import bp as main_bp
        app.register_blueprint(main_bp)
        db.create_all()

    return app