FROM python:3.8
## App engine stuff
# Expose port you want your app on
EXPOSE 8000

# Upgrade pip 
RUN pip install -U pip

COPY requirements.txt app/requirements.txt
RUN pip install -r app/requirements.txt

# Create a new directory for app (keep it in its own directory)
COPY saved_model.pb /app
COPY imdb_main.py /app

# Run
CMD ["python","imdb_main.py"]