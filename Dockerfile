FROM python:3.9-slim-buster
ADD . /python-flask
WORKDIR /python-flask
RUN pip install -r Source/requirements.txt
CMD [ "python", "./myapp.py" ]