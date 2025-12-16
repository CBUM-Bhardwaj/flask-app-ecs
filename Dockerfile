# Use the official Python 3.9 image based on Alpine Linux
# WHY: Alpine = very small image size, faster downloads, lower attack surface
FROM python:3.9-alpine

# Set the working directory inside the container
# WHY: Keeps the filesystem organized and avoids hard-coding paths
# HOW: Docker creates /app (if it doesn't exist) and runs all future commands from here
WORKDIR /app

# Copy application source files and dependency list into the container
# WHY: The container needs application code and dependency definitions to run
COPY app.py run.py requirements.txt .

# Install Python dependencies inside a custom directory
# WHY: Keeps dependencies isolated from the system Python packages
# WHY: Useful in restricted or minimal environments like Alpine
# HOW: pip reads requirements.txt and installs packages into /app/deps
RUN pip install -r requirements.txt --target=/app/deps

# Tell Python where to find the installed dependencies
# WHY: Python does not automatically search custom directories
# HOW: PYTHONPATH is added to Python’s module lookup path at runtime
ENV PYTHONPATH="/app/deps"

# Document the port the application listens on
# WHY: Helps users, Docker, and orchestration tools understand networking intent
EXPOSE 80

# Define the default command to run when the container starts
# WHY: Ensures the container runs the application automatically
CMD ["python", "run.py"]
