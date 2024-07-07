from flask import Blueprint, request, jsonify
from . import db
from .models import Visitor

bp = Blueprint('main', _name_)

@bp.route('/')
def index():
    print("Index route accessed")
    return "Welcome to the Visitor App!"

@bp.route('/visitors', methods=['POST'])
def add_visitor():
    print("Add visitor route accessed")
    data = request.get_json()
    new_visitor = Visitor(name=data['name'])
    db.session.add(new_visitor)
    db.session.commit()
    return jsonify({'message': 'Visitor added successfully'}), 201

@bp.route('/visitors', methods=['GET'])
def get_visitors():
    print("Get visitors route accessed")
    visitors = Visitor.query.all()
    visitors_list = [{'id': visitor.id, 'name': visitor.name, 'visit_time': visitor.visit_time} for visitor in visitors]
    return jsonify(visitors_list)
