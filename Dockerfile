# File: Dockerfile
# Use the official TensorFlow image to avoid the massive download step,
# which caused the "Read timed out" errors in previous runs.
FROM tensorflow/tensorflow:2.10.0

# Set working directory inside the container
WORKDIR /app

# Copy the dependency file
COPY requirements.txt .

# Install dependencies with an increased timeout to handle slow downloads
# Requirements.txt contains: Flask, yfinance, scikit-learn
RUN pip install --no-cache-dir -r requirements.txt --timeout 600

# Copy the rest of the application code (app.py, prediction.py) and the model file (lstm_model.h5)
COPY . .

# Expose the port the Flask app runs on
EXPOSE 5000

# Command to start the application
# Ensure your app.py is fixed to app.run(host='0.0.0.0', ...)
CMD ["python", "app.py"]
