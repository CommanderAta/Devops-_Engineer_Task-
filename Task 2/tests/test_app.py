import pytest
from app import create_app, db
from app.models import Visitor

@pytest.fixture
def client():
    app = create_app()
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'

    with app.test_client() as client:
        with app.app_context():
            db.create_all()
        yield client

    with app.app_context():
        db.drop_all()

def test_add_visitor(client):
    response = client.post('/visitors', json={'name': 'John Doe'})
    assert response.status_code == 201
    assert b'Visitor added successfully' in response.data

def test_get_visitors(client):
    client.post('/visitors', json={'name': 'John Doe'})
    response = client.get('/visitors')
    assert response.status_code == 200
    data = response.get_json()
    assert len(data) == 1
    assert data[0]['name'] == 'John Doe'
