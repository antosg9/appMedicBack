# 💊 Backend AppMedic

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Pytest](https://img.shields.io/badge/Pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white)

## 🎉 Welcome

Welcome to the **AppMedic** backend, an application designed to report essential medicines in case of supply difficulties.

Here is the link to the frontend project: [AppMedicFront](https://github.com/paulpp78/AppMedicFront)

## 📋 Prerequisites

Before starting, ensure that Docker is installed on your machine. Alternatively, you can use a local Python environment if preferred.

## 📦 Install Dependencies

### Option 1: Using Docker

1. Build the Docker image:

   ```bash
   docker build -t appmedic-backend .
   ```

2. Run the Docker container:

   ```bash
   docker run -p 3000:3000 appmedic-backend
   ```

Your backend application will be available at `http://localhost:3000`.

### Option 2: Local Python Environment

1. Ensure Python and pip are installed on your machine.
2. Clone the repository:

   ```bash
   git clone git@github.com:paulpp78/appMedic.git
   ```

3. Navigate to the backend folder:

   ```bash
   cd appMedic/appMedicBack
   ```

4. Create and activate a virtual environment:

   ```bash
   python -m venv venv
   source venv/bin/activate   # On Windows, use `venv\Scripts\activate`
   ```

5. Install dependencies from `requirements.txt`:

   ```bash
   pip install -r requirements.txt
   ```

6. Start the application:

   ```bash
   flask run --host=0.0.0.0 --port=3000
   ```

Your backend application will be available at `http://localhost:3000`.

## ⚙️ Configuration

Ensure all necessary configurations (such as environment variables) are set. You can create a `.env` file in the root directory with the required configurations.

## ✅ Running Tests

To execute unit tests, use the following command:

```bash
pytest
```

Make sure all test dependencies are installed in your environment.

## 🌍 Deployment

To deploy the application, you can use Docker as described above, or configure a server according to your specific needs.
