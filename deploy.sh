helm install -f ./helm/redis-backend/values.yaml redis1 .
helm install -f ./helm/golang-app/values.yaml golang1 .
