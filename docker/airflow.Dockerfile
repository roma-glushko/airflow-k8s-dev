FROM apache/airflow:2.3.0-python3.10 as base

COPY ./dags/ ${AIRFLOW_HOME}/dags/