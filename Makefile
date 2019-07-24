export IMAGE_NAME?=5thempire/pyspark
export IMAGE_TAG?=latest

SPARK_CMD = docker exec -ti spark

setup:
	docker-compose down
	docker-compose up -d spark

notebook:
	@$(SPARK_CMD) jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root

bash:
	@$(SPARK_CMD) bash

pyspark:
	@$(SPARK_CMD) spark-submit $(FILE_PATH)

pyspark-shell:
	@$(SPARK_CMD) pyspark

pi-sample:
	@$(SPARK_CMD) spark-submit /opt/pyspark/pi.py

pi-debug:
	@$(SPARK_CMD) python /opt/pyspark/pi_pdb.py

clean:
	find . -name '*.py[co]' -delete
	find . -name '__pycache__'  -exec rm -r '{}' \;
	rm -rf build/ dist/ *.egg metrics_health.egg-info