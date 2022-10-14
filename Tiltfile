project_name = "airflow-k8s"

docker_build(
  '%s/airflow:dev' % project_name,
  '.',
  dockerfile='docker/airflow.Dockerfile',

  live_update=[
    sync('./dags', '/opt/airflow/dags'),
  ],
)

k8s_yaml(helm('chart', name=project_name, namespace='airflow'))

k8s_resource('%s-scheduler' % project_name, labels=["airflow"])
k8s_resource('%s-run-airflow-migrations' % project_name, labels=["airflow"])
k8s_resource('%s-triggerer' % project_name, labels=["airflow"])
k8s_resource('%s-webserver' % project_name, port_forwards=8080, labels=["airflow"])
k8s_resource('%s-create-user' % project_name, resource_deps=['%s-postgresql' % project_name], labels=["airflow"])
k8s_resource('%s-postgresql' % project_name, labels=["airflow"])
