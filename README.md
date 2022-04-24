# ICU-realtime-monitoring
Realtime monitoring for ICU patients

# APIs
1. To add a sensor reading to database of a specific sensor via sensor ID<br>
```
http://localhost:8080/add-sensor-reading?id=<sensor_id>&value=<value>&rate=<sending_rate>
```

2. To get a single reading for a specific sensor (last uploaded reading)
```
http://localhost:8080/get-sensor-reading?id=<sensor_id>
```
3. To get the whole stored data for a sensor
```
http://localhost:8080/get-sensor-all-data?id=<sensor_id>
```