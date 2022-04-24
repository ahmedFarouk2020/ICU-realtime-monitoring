import json
from flask import Flask, request

from db import DB




app = Flask(__name__)




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
    reading = icu_db.mycursor.fetchone()[1] # pick up data only
    return str(reading) 


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


app.run(debug=True, port=8080)