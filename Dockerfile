FROM python:3.10-slim

# Install git
RUN apt-get update && apt-get install -y git

# Clone the repo
RUN git clone https://github.com/xtekky/gpt4free.git /gpt4free

# Set working directory
WORKDIR /gpt4free

# Install Python dependencies from the repo
RUN pip install --no-cache-dir -r requirements.txt

# Install Streamlit explicitly
RUN pip install --no-cache-dir streamlit

# Expose Streamlit port
EXPOSE 8501

# Run the Streamlit GUI
CMD ["streamlit", "run", "gui/streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
