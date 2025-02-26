# Use an official Python image as the base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY test-app.py requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 80
EXPOSE 80

# Run the application on port 80
CMD ["python", "test-app.py"]
