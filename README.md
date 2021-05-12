# Text Classification on IMDb Reviews.

We are going to build a TensorFlow model (v2) and using FastAPI create REST API calls to predict from the model, and finally containerize it using Docker.😃

I want to emphasize the usage of FastAPI and how rapidly this framework is a game-changer for building easy to go and much faster API calls for a machine learning pipeline.
I found FastAPI to be pretty user-friendly and very easy to pick up and implement type of framework.

## Data Description
We have used a text classification problem : IMDb Dataset for the purpose of building the model.

The dataset comprises 50,000 reviews of movies and is a binary classification problem with the target variable being a sentiment: positive or negative.

## Preprocessing
We use Tensorflow's TextVectorization layer which tidies things up and outputs a layer which we will be using in the process of creating a graph on a Sequential or Functional Model.

We can go for custom standardization by curating a function for our own use case but there are some bugs in tf:2.4.1 which create trouble whilst creating REST API call for the model.


## Model
As we can see below, we are using the encoder layer on the top of Embedding that outputs us with a 256 dimension vector.
The rest of the graph is self-explanatory, although we are giving a probabilistic output instead of a 2-class softmax layer: the closer the probability to 1 meaning a positive sentiment for the review and vice-versa.

After initialising the graph, we compile and fit the model.

## Evaluation

After model training, we evaluate the model on the test dataset and get a reasonably satisfactory test accuracy of 86.2%
(Although our major focus is the API & Docker and not extending our virtues in model building for this scenario)

In TensorFlow, we can save the model in two ways: 'tf' or '.h5' format. Our model cannot be saved in '.h5' format since we are using the TextVectorization layer.

## FastAPI
Before we start creating APIs, we need a particular directory structure that will be utilized for creating a Docker image.

tf_keras_imdb/ : SavedModel from TensorFlow

imdb_main.py : Python file for creating REST APIs using FastAPI framework

Whenever we are building an API using FastAPI, we use pydantic to set the type of input our API expects. For eg, a list, dictionary, JSON, string, integer, float.

To create an object using pydantic, we use BaseModel that defines our type of inputs.

One of the reasons why FastAPI is faster and more efficient is its usage of ASGI - Asynchronous Server Gateway Interface, instead of traditional WSGI - Web Server Gateway Interface (which is used in Flask, Django)

POST request is assigned to our prediction API, since it requires us to post the data and fetch back the results.

Uvicorn is a lightning-fast ASGI server implementation, which creates a server on our host machine and lets our API host the model on.

We can test our API.

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/FASTAPI_App_Home.png)

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/FASTAPI_App_Test.png)

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/FASTAPI_App_Pred.png)

## Docker
Created a Dockerfile.

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/Docker_Build.png)

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/Docker_Run.png)

## Heroku
Built an Heroku app for the same.

![](https://github.com/rushabhrumde/DEMD_Project/blob/main/Output%20Screenshots/Heroku_Build.png)

## Conclusion
After going through the process of working around FastAPI and Docker, I feel this skillset is a necessary repertoire in a data scientist's toolkit. The process of building around our model and deploying it has become easier and much more accessible than it was before.
