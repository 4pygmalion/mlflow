FROM python:3.8
RUN python -m pip install --upgrade pip
RUN pip install cryptography pymysql
RUN pip install mlflow==2.7.1
EXPOSE ${MLFLOW_PORT}