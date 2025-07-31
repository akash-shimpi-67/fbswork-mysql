CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    date_of_birth DATE,
    gender TEXT,
    contact TEXT,
    insurance TEXT
)
INSERT into Patients(first_name,last_name,date_of_birth,gender,contact,insurance)
values
 ("John", "Doe", "1985-03-15", "Male", "123-456-7890", "InsureCo A"),
    ("Jane", "Smith", "1990-08-21", "Female", "234-567-8901", "InsureCo B"),
    ("Alice", "Brown", "1975-12-30", "Female", "345-678-9012", "InsureCo C"),
    ("Bob", "Johnson", "1988-07-05", "Male", "456-789-0123", "InsureCo A"),
    ("Charlie", "Davis", "1992-11-17", "Male", "567-890-1234", "InsureCo B");


    CREATE TABLE Medical_History (
    history_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    diagnosis TEXT,
    allergies TEXT,
    medications TEXT,
    previous_treatments TEXT,
    FOREIGN KEY(patient_id) REFERENCES Patients(patient_id)
)
INSERT INTO Doctors (name, specialty, contact, license_number) VALUES
(1, "Hypertension", "None", "Lisinopril", "Lifestyle changes"),
    (2, "Asthma", "Pollen", "Albuterol", "Inhaler therapy"),
    (3, "Diabetes", "None", "Metformin", "Diet management"),
    (4, "Anxiety", "None", "Sertraline", "CBT"),
    (5, "Arthritis", "Penicillin", "Ibuprofen", "Physical therapy")



CREATE TABLE Encounters (
    encounter_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    appointment_date DATE,
    admission_date DATE,
    discharge_date DATE,
    reason TEXT,
    FOREIGN KEY(patient_id) REFERENCES Patients(patient_id)
)
INSERT INTO Medical_History (patient_id, diagnosis, allergies, medications, previous_treatments) VALUES
 (1, "2023-01-10", "2023-01-10", "2023-01-15", "Chest pain"),
    (2, "2023-02-20", "2023-02-20", "2023-02-25", "Shortness of breath"),
    (3, "2023-03-05", "2023-03-05", "2023-03-10", "High blood sugar"),
    (4, "2023-04-12", "2023-04-12", "2023-04-18", "Panic attacks"),
    (5, "2023-05-22", "2023-05-22", "2023-05-27", "Joint pain")



CREATE TABLE Diagnosis_Tests (
    test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    test_type TEXT,
    result TEXT,
    test_date DATE,
    FOREIGN KEY(patient_id) REFERENCES Patients(patient_id)
)
INSERT INTO Diagnosis_Tests (patient_id, test_type, result, test_date) VALUES
(1, "ECG", "Normal", "2023-01-11"),
    (2, "Pulmonary Function Test", "Mild Restriction", "2023-02-21"),
    (3, "HbA1c", "8.2%", "2023-03-06"),
    (4, "MRI Brain", "Normal", "2023-04-13"),
    (5, "X-Ray Knee", "Moderate degeneration", "2023-05-23")


CREATE TABLE Doctors (
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    specialty TEXT,
    contact TEXT,
    license_number TEXT
)
insert into doctors(name,specialty,contact,license_number)
values
 ("Dr. Emily White", "Cardiology", "123-555-1111", "LIC12345"),
    ("Dr. Mark Green", "Neurology", "123-555-2222", "LIC67890")




CREATE TABLE Prescriptions (
    prescription_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    medication TEXT,
    dosage TEXT,
    instructions TEXT,
    dispensing_details TEXT,
    prescription_date DATE,
    FOREIGN KEY(patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES Doctors(doctor_id)
)
INSERT INTO Diagnosis_Tests (patient_id, test_type, result, test_date) VALUES
 (1, 1, "Lisinopril", "10mg daily", "With food", "Pharmacy A", "2023-01-15"),
    (2, 1, "Albuterol", "2 puffs", "As needed", "Pharmacy B", "2023-02-25"),
    (3, 2, "Metformin", "500mg twice daily", "With meals", "Pharmacy A", "2023-03-10"),
    (4, 2, "Sertraline", "50mg daily", "In morning", "Pharmacy C", "2023-04-18"),
    (5, 1, "Ibuprofen", "400mg as needed", "After meals", "Pharmacy D", "2023-05-27")
]

CREATE TABLE Procedures (
    procedure_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    procedure_name TEXT,
    procedure_date DATE,
    doctor_id INTEGER,
    notes TEXT,
    FOREIGN KEY(patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES Doctors(doctor_id)
)
INSERT INTO Procedures (patient_id, procedure_name, procedure_date, doctor_id, notes) VALUES
  (1, "Angioplasty", "2023-01-14", 1, "Successful"),
    (2, "Bronchoscopy", "2023-02-24", 2, "No obstruction found"),
    (3, "Insulin Pump Installation", "2023-03-09", 1, "Patient trained"),
    (4, "Cognitive Behavioral Therapy", "2023-04-17", 2, "10 sessions planned"),
    (5, "Arthroscopy", "2023-05-26", 1, "Rehab advised")