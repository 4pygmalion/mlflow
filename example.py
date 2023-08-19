import os
import mlflow

if __name__ == "__main__":
    TRACKING_URI = "http://localhost:5000/"
    EXP_NAME = "TEST_EXP1"
    RUN_NAME = "TEST_RUN1"
    mlflow.set_tracking_uri(TRACKING_URI)

    MLFLOW_CLIENT = mlflow.MlflowClient(tracking_uri=TRACKING_URI)
    exp = MLFLOW_CLIENT.get_experiment_by_name(EXP_NAME)
    if exp is None:
        exp = MLFLOW_CLIENT.create_experiment(EXP_NAME)
    exp = MLFLOW_CLIENT.get_experiment_by_name(EXP_NAME)
    exp_id = exp.experiment_id

    with mlflow.start_run(experiment_id=exp_id, run_name=RUN_NAME):
        print("tracking uri:", mlflow.get_tracking_uri())
        print("artifact uri:", mlflow.get_artifact_uri())

        mlflow.log_artifact(os.path.abspath(__file__))
        mlflow.log_metrics({"accuracy": 1.0})
