@echo off

FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set localIp=%%i

echo Your IP Address is: %localIp%

@REM minikube ssh "export ipaddr=%localIp% && rm -f build.sh && wget http://$ipaddr:8000/sftp/k8s/build.sh && sh build.sh" && kubectl apply -f k8s/ && kubectl delete -f k8s/ && kubectl apply -f k8s/
minikube ssh "export ipaddr=%localIp% && rm -f build.sh && wget http://$ipaddr:8000/sftp/k8s/build.sh && sh build.sh"  && kubectl apply -f k8s/