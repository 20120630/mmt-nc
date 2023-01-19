FROM python:3.9-slim-buster
ADD . /python-flask
WORKDIR /python-flask
RUN pip install -r requirements.txt
CMD [ "python", "./main.py" ]
