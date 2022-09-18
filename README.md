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

4. To get the content of all table's data
```
http://localhost:8080/get-table?tname=<table_name>
```

5. To put a patient in a high priority position via patient id

```
http://localhost:8080/set-emergency-call?id=<patient_id>
```

6. To remove a patient from emergency status

```
http://localhost:8080/end-emergency-call?id=<patient_id>
```

7. To know which patient in the emergency status

```
http://localhost:8080/get-emergency-status
```

8. To get the rate of sending data for a patient

```
http://localhost:8080/get-patient-rate?id=<patient_id>
```

