FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

# Upgrade pip 
RUN pip install -U pip

COPY requirements.txt app/requirements.txt
RUN pip install -r app/requirements.txt

#Create a new directory for app (keep it in its own directory)
COPY . . 

# Expose port you want your app on
EXPOSE 8000

#Run
CMD ["python","imdb_main.py"]
