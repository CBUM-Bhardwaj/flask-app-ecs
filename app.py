from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return (
        "Hello Dosto 👋\n"
        "This Flask application is part of my DevOps learning journey.\n"
        "Built to practice Docker, CI/CD pipelines, and deployment on AWS ECS.\n"
        "Focus: infrastructure, automation, and real-world deployment — not fancy UI."
        "🔗 LinkedIn: https://www.linkedin.com/in/cbum-bhardwaj"
    )

@app.route('/health')
def health():
    return "OK - Application is healthy and running as expected"
