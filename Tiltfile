project_name = "airflow-k8s"

k8s_yaml(helm('chart', name=project_name))

k8s_resource('%s-webserver' % project_name, port_forwards=8080)
k8s_resource('%s-create-user' % project_name, resource_deps=['%s-postgresql' % project_name])

docker_build(
  '%s/airflow:dev' % project_name,
  '.',
  dockerfile='docker/airflow.Dockerfile',

  live_update=[
    sync('./dags', '/usr/local/airflow/dags'),
  ])
)