import sqlite3

class DB():
    def __init__(self) -> None:

        self.db = sqlite3.connect('memory.sqlite')
        self.mycursor = self.db.cursor()
        try:
            self.mycursor.executescript('''CREATE TABLE temp0
                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                    value INT NOT NULL,               
                    send_rate INT NOT NULL              
                    );
                    CREATE TABLE temp1
                    (id INTEGER PRIMARY KEY AUTOINCREMENT,
                    value INT NOT NULL,
                    send_rate INT NOT NULL
                    );
                    CREATE TABLE rooms
                    (room_id INT PRIMARY KEY,
                    p1_id INT UNIQUE,
                    p2_id INT UNIQUE,
                    p3_id INT UNIQUE
                    );
                    CREATE TABLE patients
                    (patient_id INT PRIMARY KEY,
                    s1_id VARCHAR(15) UNIQUE,
                    s2_id VARCHAR(15) UNIQUE,
                    s3_id VARCHAR(15) UNIQUE
                    );

                    ''')
                    # p1_id -> patient1 ID
                    # s1_id -> sensor1 ID -> table name -> temp0 -> module_name+id
        except:
            print("Tables Already exist")    
    def execute_sql_command(self,sql: str):
        """ execute sql commands which is in the form of formatted string """
        self.mycursor.execute(sql)
        try:
            self.db.commit()
        except:
            print("Changes already commited")


# db = sqlite3.connect('memory')
# cursor = db.cursor()


# cursor.executescript('''CREATE TABLE temp0
#                 (id INTEGER PRIMARY KEY AUTOINCREMENT,
#                 value INT NOT NULL               
#                 rate INT NOT NULL,             
#                 );
#                 CREATE TABLE temp1
#                 (id INTEGER PRIMARY KEY AUTOINCREMENT,
#                 value INT NOT NULL,
#                 rate INT NOT NULL
#                 );
#                 CREATE TABLE rooms
#                 (room_id INT PRIMARY KEY,
#                 p1_id INT UNIQUE,
#                 p2_id INT UNIQUE,
#                 p3_id INT UNIQUE
#                 );
#                 CREATE TABLE patients
#                 (patient_id INT PRIMARY KEY,
#                 s1_id VARCHAR(15) UNIQUE,
#                 s2_id VARCHAR(15) UNIQUE,
#                 s3_id VARCHAR(15) UNIQUE
#                 );

#                 ''')
#                 # p1_id -> patient1 ID
#                 # s1_id -> sensor1 ID -> table name -> temp0 -> module_name+id



# cursor.executescript("""
#                 INSERT INTO temp0 (value) VALUES (10);
#                 INSERT INTO temp1 (value) VALUES (11);
#                 INSERT INTO patients (patient_id,s1_id, s2_id) VALUES (10,"temp7","temp8");
               
#                 INSERT INTO patients (patient_id,s1_id, s2_id) VALUES (50,"temp30","temp40");
#                 INSERT INTO rooms (room_id,p1_id) VALUES (1,0);
#                 """)

# db.commit()

# print("temp0")
# cursor.execute("""
#                 SELECT * from temp0
#                 """)

# print(cursor.fetchall())

# print("temp1")
# cursor.execute("""
#                 SELECT * from temp1
#                 """)

# print(cursor.fetchall())

# print("patients")
# cursor.execute("""
#                 SELECT * from patients
#                 """)

# print(cursor.fetchall())

# print("rooms")
# cursor.execute("""
#                 SELECT * from rooms
#                 """)

# print(cursor.fetchall())

# print("Elhamdulella")
