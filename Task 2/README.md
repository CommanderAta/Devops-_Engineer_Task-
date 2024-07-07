# Visitor Management Application

This application interacts with the MySQL database hosted on RDS, created in Part 1 of the infrastructure setup. The application provides endpoints to add and retrieve visitors from the database.

## Requirements

### Application Functionality

- Connect to the MySQL database hosted on RDS.
- Create a table `visitors` with columns `id`, `name`, and `visit_time`.
- Implement two functionalities:
  - A POST endpoint to add a visitor's name to the table.
  - A GET endpoint to retrieve a list of all visitors.

### Testing

- Include unit tests for the application.
- Use a testing framework of your choice (e.g., `pytest` for Python).

## Setup Instructions

### Prerequisites

- Ensure you have Python installed. You can download it from the official website.

### Setting Up the Application

1. Clone the Repository.

2. Install Dependencies.

    ```bash
    pip install -r requirements.txt
    ```

3. Configure Database Connection by updating the `config.py` file with your RDS instance details (host, user, password, database name).

4. Run the Application.

    ```bash
    python app.py
    ```

### Running Tests

1. Install Testing Dependencies.

    ```bash
    pip install -r test-requirements.txt
    ```

2. Run Unit Tests.

    ```bash
    pytest
    ```

## File Structure

- `app.py`: Main application file containing the endpoints.
- `config.py`: Configuration file for database connection details.
- `app/models.py`: Contains the Visitor model.
- `app/views.py`: Contains the routes and endpoint logic.
- `requirements.txt`: Python dependencies.
- `test-requirements.txt`: Python testing dependencies.
- `tests/test_app.py`: Unit tests for the application.

## Endpoints

### POST /visitors

Add a visitor's name to the database.

**Request**:

- name: "John Doe"

**Response**:

- message: "Visitor added successfully"

### GET /visitors

Retrieve a list of all visitors.

**Response**:

- id: Visitor ID
- name: Visitor Name
- visit_time: Visit Time

## Submission Instructions

1. Create a GitHub Repository.
2. Upload all your code to the GitHub repository.
3. Provide the repository link along with any necessary instructions for running your solution.

## Assumptions

- The MySQL RDS instance is up and running, and the connection details are correct in `config.py`.
- Basic knowledge of Python and REST API development is assumed.
