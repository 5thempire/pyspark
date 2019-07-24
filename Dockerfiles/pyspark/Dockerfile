FROM 5thempire/spark:latest
LABEL  maintainer "developers@5thempire.pt"

# PYTHON
COPY code/ /opt/pyspark/
COPY requirements.txt /opt/pyspark/
RUN pip install -r /opt/pyspark/requirements.txt
ENV PYTHONPATH=/opt/pyspark/
ENV PYTHONUNBUFFERED 1
