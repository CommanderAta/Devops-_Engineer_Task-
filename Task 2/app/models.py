from . import db
from datetime import datetime

class Visitor(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    visit_time = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f'<Visitor {self.name}>'
