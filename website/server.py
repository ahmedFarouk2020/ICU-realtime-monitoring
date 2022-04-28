from flask import Flask, request
import requests
from db import DB


app = Flask(__name__)

high_priority_patient = "Null"


@app.route("/add-sensor-reading")
def addSensorReading():
    """ Upload a reading to the db """
    icu_db = DB()
    sensor_id = str(request.args.get('id'))
    sensor_reading = str(request.args.get('value'))
    sending_rate = str(request.args.get('rate'))

    command = f"INSERT INTO {sensor_id} (value,send_rate) VALUES ({sensor_reading},{sending_rate})"
    icu_db.execute_sql_command(command)

    return f"""
            <h2>UPDATED</h2>
            <h4>Sensor: {sensor_id} </h4>
            <h4>Value: {sensor_reading} </h4>
            <h4>Sending Rate: {sending_rate} </h4>
            """



@app.route("/get-sensor-reading")
def getSensorReading():
    """ Retrieve the last reading """
    icu_db = DB()
    sensor_id = str(request.args.get('id'))
    
    print(sensor_id)
    command = f"SELECT * FROM {sensor_id} ORDER BY id DESC LIMIT 1"
    icu_db.execute_sql_command(command)
    last_row = icu_db.mycursor.fetchone() # pick up the entire row
    reading, reading_id, sending_rate = last_row
    return (str(reading) + " " + str(reading_id))


@app.route("/get-sensor-all-data")
def getAllSensorData():
    """ Retrieve data from old to new """
    icu_db = DB()
    sensor_id = str(request.args.get('id'))

    command = f"select * from {sensor_id} LIMIT 1000"
    icu_db.execute_sql_command(command)
    
    all_readings = icu_db.mycursor.fetchall()

    all_readings = [all_readings[i][1] for i in range(len(all_readings))]
    return str(all_readings)

@app.route('/get-emergency-status') # tested
def getEmergencyStatus():
    """ return patient id of emergency case """
    global high_priority_patient
    return str(high_priority_patient)


@app.route('/get-patient-rate') # tested
def getPatientRate(): 
    """ returns the rate of retieve patient data by sensors """
    icu_db = DB()
    patient_id = str(request.args.get('id'))
    
    command = f"SELECT patient_rate FROM patients WHERE patient_id={patient_id};"
    icu_db.execute_sql_command(command)
    rate = icu_db.mycursor.fetchone()[0] 
    return str(rate)


    

@app.route('/set-emergency-call') # has't finished
def setEmergencyCall():
    """ get id of high priority patient """
    global high_priority_patient

    icu_db = DB()
    patient_id = str(request.args.get('id'))
    
    if high_priority_patient != "Null": # aonther patient is in the priority state
        resp = requests.get(f"http://{host}:8080/end-emergency-call?id={high_priority_patient}")
        print(resp.status_code)


    high_priority_patient = patient_id

    print(patient_id)
    command = f"UPDATE patients SET patient_rate={2} WHERE patient_id={patient_id}"
    icu_db.execute_sql_command(command)
    
    return f"<h2>Patient with ID={patient_id} got higher priority</h2>"


@app.route('/end-emergency-call') # has't finished
def endEmergencyCall():
    """ clear a patient from priority state via his id """
    global high_priority_patient

    icu_db = DB()
    patient_id = str(request.args.get('id'))
    
    high_priority_patient = "Null" # reset state -> no priority patients

    print(patient_id)
    command = f"UPDATE patients SET patient_rate={1} WHERE patient_id={patient_id}"
    icu_db.execute_sql_command(command)
    
    return f"<h2>Normal states: No priorities</h2>"


host = "127.0.0.1"
app.run(debug=True, port=8080)


""" to change row value

UPDATE employees 
SET 
    address = '1300 Carter St',
    city = 'San Jose',
    postalcode = 95125,
    region = 'CA'
WHERE
    employeeID = 3;

"""