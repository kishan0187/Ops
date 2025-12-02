# File: Dockerfile
# Using the official TensorFlow image to avoid large downloads and timeouts.
FROM tensorflow/tensorflow:2.10.0

# Set working directory inside the container
WORKDIR /app

# Install remaining dependencies
COPY requirements.txt .
# pip will install Flask, yfinance, and scikit-learn
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code and the model file (.h5)
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]