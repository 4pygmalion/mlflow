FROM python:3.8
RUN python -m pip install --upgrade pip
RUN pip install cryptography pymysql
RUN pip install mlflow==2.5.0
EXPOSE ${MLFLOW_PORT}