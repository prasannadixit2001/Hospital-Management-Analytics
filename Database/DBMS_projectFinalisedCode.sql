-- CREATE DATABASE project_curry_boys1
-- GO
USE project_curry_boys1
Go

-- down metadata

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_doctors_doctor_appointment_id')
    Alter table Doctors DROP CONSTRAINT fk_doctors_doctor_appointment_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_appointments_appointment_patient_id')
    Alter table Appointments DROP CONSTRAINT fk_appointments_appointment_patient_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_patients_doctors_patient_id')
    Alter table Patients_Doctors DROP CONSTRAINT fk_patients_doctors_patient_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_patients_doctors_doctor_id')
    Alter table Patients_Doctors DROP CONSTRAINT fk_patients_doctors_doctor_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Medical_Histories_patient_id')
    Alter table Patients_Medical_Histories DROP CONSTRAINT fk_Patients_Medical_Histories_patient_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Medical_Histories_medical_history_id')
    Alter table Patients_Medical_Histories DROP CONSTRAINT fk_Patients_Medical_Histories_medical_history_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patient_Allergy_allergy_id')
    Alter table Patient_Allergies DROP CONSTRAINT fk_Patient_Allergy_allergy_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patient_Allergy_patient_id')
    Alter table Patient_Allergies DROP CONSTRAINT fk_Patient_Allergy_patient_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Medical_Histories_Patients_Precondition_medical_history_id')
    Alter table Medical_Histories_Patients_Preconditions DROP CONSTRAINT fk_Medical_Histories_Patients_Precondition_medical_history_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Medical_Histories_Patients_Precondition_precondition_id')
    Alter table Medical_Histories_Patients_Preconditions DROP CONSTRAINT fk_Medical_Histories_Patients_Precondition_precondition_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Insurances_patient_id')
    Alter table Patients_Insurances DROP CONSTRAINT fk_Patients_Insurances_patient_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Insurances_insurance_id')
    Alter table Patients_Insurances DROP CONSTRAINT fk_Patients_Insurances_insurance_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Emergency_Contacts_patient_id')
    Alter table Patients_Emergency_Contacts DROP CONSTRAINT fk_Patients_Emergency_Contacts_patient_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Emergency_Contacts_emergency_contact_id')
    Alter table Patients_Emergency_Contacts DROP CONSTRAINT fk_Patients_Emergency_Contacts_emergency_contact_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Bills_patient_id')
    Alter table Patients_Bills DROP CONSTRAINT fk_Patients_Bills_patient_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Patients_Bills_bill_id')
    Alter table Patients_Bills DROP CONSTRAINT fk_Patients_Bills_bill_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_doctors_department_id')
    ALTER TABLE Doctors DROP CONSTRAINT fk_doctors_department_id 

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_medical_histories_allergy_id')
    ALTER TABLE medical_histories DROP CONSTRAINT fk_medical_histories_allergy_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_patients_disease_id')
    ALTER TABLE Patients DROP CONSTRAINT fk_patients_disease_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_appointments_doctor_id')
    ALTER TABLE Appointments DROP CONSTRAINT fk_appointments_doctor_id

    
DROP TABLE if EXISTS Doctors
DROP TABLE if EXISTS Departments
DROP TABLE if EXISTS Appointments
DROP TABLE if EXISTS Patients
DROP TABLE if EXISTS Patients_Doctors
DROP TABLE if EXISTS Medical_Histories
DROP TABLE if EXISTS Patients_Medical_Histories
DROP TABLE if EXISTS Allergies
DROP TABLE if EXISTS Patient_Allergies
DROP TABLE if EXISTS Pre_Conditions
DROP TABLE if EXISTS Medical_Histories_Patients_Preconditions
DROP TABLE if EXISTS Bills
DROP TABLE if EXISTS Patients_Bills
DROP TABLE if EXISTS Insurances
DROP TABLE if EXISTS Patients_Insurances
DROP TABLE if EXISTS Emergency_Contacts
DROP TABLE if EXISTS Patients_Emergency_Contacts
DROP TABLE if EXISTS Diseases



-- up metadata

CREATE TABLE Doctors (
    doctor_id INT identity(1,1),
    doctor_first_name VARCHAR(255),
    doctor_last_name VARCHAR(255),
    doctor_email VARCHAR(255),
    doctor_contact_number VARCHAR(255),
    doctor_sex CHAR(10),
    doctor_qualifications TEXT,
    doctor_department_id INT,
    CONSTRAINT pk_doctors_doctor_id PRIMARY KEY(doctor_id)
)
CREATE TABLE Departments (
    department_id INT identity(1,1),
    department_name VARCHAR(255),
    department_manager VARCHAR(255),
    CONSTRAINT pk_departments_department_id PRIMARY KEY(department_id)
)
CREATE TABLE Appointments (
    appointment_id INT identity(1,1),
    appointment_date DATE,
    appointment_patient_id INT,
    appointment_doctor_id INT,
    CONSTRAINT pk_appointments_appointment_id PRIMARY KEY(appointment_id)
)
CREATE TABLE Patients (
    patient_id INT identity(1,1),
    patient_first_name VARCHAR(255),
    patient_last_name VARCHAR(255),
    patient_email VARCHAR(255),
    patient_contact_number VARCHAR(255),
    patient_state VARCHAR(30),
    patient_sex CHAR(1),
    patient_age INT,
    disease_id INT,
    CONSTRAINT pk_patients_patient_id PRIMARY KEY(patient_id)
)
CREATE TABLE Medical_Histories (
    medical_history_id INT identity(1,1),
    medical_history_patient_first_name VARCHAR(255),
    medical_history_patient_last_name VARCHAR(255),
    medical_history_allergy_id INT,
    CONSTRAINT pk_medical_histories_medical_history_id PRIMARY KEY(medical_history_id)
)
CREATE TABLE Patients_Medical_Histories (
    patient_id INT,
    medical_history_id INT,
--    CONSTRAINT pk_patients_medical_histories_patient_id PRIMARY KEY(patient_id),
--    CONSTRAINT pk_patients_medical_histories_medical_history_id PRIMARY KEY(medical_history_id)
)
CREATE TABLE Allergies (
    allergy_id INT identity(1,1),
    allergy_name VARCHAR(255),
    CONSTRAINT pk_allergies_allergy_id PRIMARY KEY(allergy_id),
)
CREATE TABLE Diseases (
    disease_id INT identity(1,1),
    disease_name VARCHAR(255),
    CONSTRAINT pk_diseases_disease_id PRIMARY KEY(disease_id),
)
CREATE TABLE Bills (
    bill_id INT identity(1,1),
    bill_amount DECIMAL(10, 2),
    bill_date DATE,
    bill_insurance_number VARCHAR(255),
    CONSTRAINT pk_bills_bill_id PRIMARY KEY(bill_id)
)
CREATE TABLE Patients_Bills (
    patient_id INT,
    bill_id INT,
    -- CONSTRAINT pk_patients_bills_patient_id PRIMARY KEY(patient_id),
 --   CONSTRAINT pk_patients_bills_bill_id PRIMARY KEY(bill_id)
)
CREATE TABLE Insurances (
    insurance_id INT identity(1,1),
    insurance_company_name VARCHAR(255),
    insurance_coverage VARCHAR(255),
	insurance_premium INT,
	Insurance_payment_frequency VARCHAR(255),
    CONSTRAINT pk_insurances_insurance_id PRIMARY KEY(insurance_id)
)
CREATE TABLE Patients_Insurances (
    patient_id INT,
    insurance_id INT,
--    CONSTRAINT pk_patients_insurances_patient_id PRIMARY KEY(patient_id),
 --   CONSTRAINT pk_patients_insurances_insurance_id PRIMARY KEY(insurance_id)
)
CREATE TABLE Emergency_Contacts (
    emergency_contact_id INT identity(1,1),
    emergency_contact_patient_first_name VARCHAR(255),
    emergency_contact_patient_last_name VARCHAR(255),
    emergency_contact_phone_number VARCHAR(255),
    emergency_contact_person_address TEXT,
    CONSTRAINT pk_emergency_contact_emergency_contact_id PRIMARY KEY(emergency_contact_id)
)
CREATE TABLE Patients_Emergency_Contacts (
    patient_id INT,
    emergency_contact_id INT,
--    CONSTRAINT pk_patients_emergency_contacts_patient_id PRIMARY KEY(patient_id),
 --   CONSTRAINT pk_patients_emergency_contacts_emergency_contact_id PRIMARY KEY(emergency_contact_id)
)

ALTER TABLE Doctors
    ADD CONSTRAINT fk_doctors_department_id FOREIGN KEY (doctor_department_id)
    REFERENCES Departments(department_id)
GO

ALTER TABLE Patients
    ADD CONSTRAINT fk_patients_disease_id FOREIGN KEY (disease_id)
    REFERENCES Diseases(disease_id)
GO

ALTER TABLE Appointments
    ADD CONSTRAINT fk_appointments_appointment_patient_id FOREIGN KEY (appointment_patient_id) 
    REFERENCES Patients(patient_id)
ALTER TABLE Appointments
    ADD CONSTRAINT fk_appointments_doctor_id FOREIGN KEY (appointment_doctor_id)
    REFERENCES Doctors(doctor_id)
GO

ALTER TABLE Patients_Medical_Histories
    ADD CONSTRAINT fk_Patients_Medical_Histories_patient_id FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
GO

ALTER TABLE medical_histories 
    ADD CONSTRAINT fk_medical_histories_allergy_id FOREIGN KEY(medical_history_allergy_id)
        REFERENCES Allergies(allergy_id)
GO

ALTER TABLE Patients_Insurances 
    ADD CONSTRAINT fk_Patients_Insurances_patient_id FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
ALTER TABLE Patients_Insurances
    ADD CONSTRAINT fk_Patients_Insurances_insurance_id FOREIGN KEY (insurance_id) 
    REFERENCES Insurances(insurance_id)
GO

ALTER TABLE Patients_Emergency_Contacts
    ADD CONSTRAINT fk_Patients_Emergency_Contacts_patient_id FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
ALTER TABLE Patients_Emergency_Contacts
    ADD CONSTRAINT fk_Patients_Emergency_Contacts_emergency_contact_id FOREIGN KEY (emergency_contact_id) 
   REFERENCES Emergency_Contacts(emergency_contact_id)
GO
-- Up data

INSERT INTO Diseases (disease_name) VALUES
('Coronary artery disease'), ('Hypertension'), ('Heart failure'), ('Arrhythmia'), ('Myocardial infarction'), ('Asthma'), ('Autism spectrum disorder'),
('Croup'), ('Diabetes (Type 1)'), ('Ear infection (Otitis media)'), ('Osteoarthritis'), ('Rheumatoid arthritis'), ('Fractures'),
('Dislocations'), ('Scoliosis'), ('Breast cancer'), ('Lung cancer'), ('Prostate cancer'), ('Leukemia'), ('Lymphoma'), ('Stroke'),
('Epilepsy'), ('Parkinson''s disease'), ('Multiple sclerosis'), ('Alzheimer''s disease'), ('Endometriosis'), ('Polycystic ovary syndrome (PCOS)'),
('Uterine fibroids'), ('Ovarian cancer'), ('Cervical dysplasia'), ('Chronic obstructive pulmonary disease (COPD)'), ('Pneumonia'), ('Pulmonary embolism'),
('Tuberculosis'), ('Diabetes (Type 2)'), ('Thyroid disorders'), ('Osteoporosis'), ('Cushing''s syndrome'), ('Addison''s disease'),
('Urinary tract infection (UTI)'), ('Kidney stones'), ('Prostate enlargement (BPH)'), ('Bladder cancer'), ('Erectile dysfunction'), ('Acne'),
('Eczema'), ('Psoriasis'), ('Skin cancer'), ('Rosacea'), ('Lupus'), ('Sj�gren''s syndrome'), ('Ankylosing spondylitis'), ('Gout'),
('Anemia'), ('Hemophilia'), ('Thrombocytopenia'), ('Leukemia'), ('Lymphoma'), ('Cataracts'), ('Glaucoma'), ('Macular degeneration'),
('Diabetic retinopathy'), ('Retinal detachment'), ('Tinnitus'), ('Sinusitis'), ('Tonsillitis'), ('Hearing loss');
-- ***************************************************************************************************************************************************************************************
INSERT INTO Patients (patient_first_name, patient_last_name, patient_email, patient_contact_number, patient_sex, patient_age, disease_id, patient_state) VALUES
('Maria', 'Harris', 'maria.harris@gmail.com', 9454645842, 'M', 71, 13, 'Pennsylvania'),
('Valerie', 'Lewis', 'valerie.lewis@gmail.com', 9085157351, 'M', 53, 13, 'North Carolina'),
('Kara', 'Gonzalez', 'kara.gonzalez@gmail.com', 6432198446, 'F', 64, 11, 'Pennsylvania'),
('Kimberly', 'Horton', 'kimberly.horton@yahoo.com', 1543858866, 'M', 72, 6, 'Utah'),
('Gabriel', 'Frederick', 'gabriel.frederick@yahoo.com', 2361670194, 'F', 85, 6, 'Wisconsin'),
('Linda', 'Nguyen', 'linda.nguyen@yahoo.com', 2119855734, 'M', 8, 7, 'Texas'),
('Shannon', 'Wolf', 'shannon.wolf@yahoo.com', 8054967118, 'M', 19, 7, 'Pennsylvania'),
('James', 'Dickerson', 'james.dickerson@hotmail.com', 8256883089, 'F', 40, 14, 'New York'),
('Chad', 'Green', 'chad.green@gmail.com', 9120408971, 'F', 26, 4, 'Pennsylvania'),
('Manuel', 'Shaw', 'manuel.shaw@gmail.com', 4133371212, 'M', 29, 11, 'Ohio'),
('Tyler', 'Cruz', 'tyler.cruz@orkut.com', 3866586000, 'F', 40, 7, 'North Carolina'),
('Ashley', 'Evans', 'ashley.evans@orkut.com', 4706381195, 'M', 45, 4, 'North Carolina'),
('Jessica', 'Odonnell', 'jessica.odonnell@yahoo.com', 3377230609, 'M', 38, 9, 'New York'),
('Robert', 'Davis', 'robert.davis@hotmail.com', 5394748218, 'F', 84, 14, 'New Mexico'),
('Robert', 'Kelley', 'robert.kelley@yahoo.com', 7839310859, 'M', 92, 11, 'North Carolina'),
('Janet', 'Ross', 'janet.ross@gmail.com', 3964103251, 'M', 22, 8, 'North Carolina'),
('Pamela', 'Tucker', 'pamela.tucker@orkut.com', 4120167957, 'F', 23, 3, 'Ohio'),
('Patricia', 'Le', 'patricia.le@gmail.com', 1194165107, 'F', 27, 2, 'Minnesota'),
('Michael', 'Adams', 'michael.adams@hotmail.com', 6743284436, 'F', 20, 13, 'Vermont'),
('Amy', 'Armstrong', 'amy.armstrong@hotmail.com', 7166509122, 'M', 93, 9, 'Vermont'),
('James', 'Cook', 'james.cook@orkut.com', 5804443632, 'F', 72, 13, 'Pennsylvania'),
('Christine', 'Davis', 'christine.davis@yahoo.com', 8695649861, 'F', 39, 3, 'Arizona'),
('Eric', 'Hill', 'eric.hill@hotmail.com', 4962133318, 'M', 12, 8, 'Florida'),
('Barry', 'Fields', 'barry.fields@yahoo.com', 4095906609, 'F', 29, 5, 'North Carolina'),
('Steven', 'Walker', 'steven.walker@gmail.com', 5448391933, 'M', 11, 2, 'New York'),
('Kimberly', 'Daniels', 'kimberly.daniels@hotmail.com', 1179237840, 'F', 81, 8, 'Minnesota'),
('Kathryn', 'Johnson', 'kathryn.johnson@gmail.com', 3615303698, 'F', 64, 11, 'North Carolina'),
('Emily', 'Floyd', 'emily.floyd@yahoo.com', 1642492726, 'M', 91, 5, 'North Carolina'),
('Marcus', 'Glover', 'marcus.glover@hotmail.com', 6165981497, 'F', 75, 9, 'Maine'),
('Edward', 'Reese', 'edward.reese@orkut.com', 1304228624, 'F', 56, 3, 'Ohio'),
('Kevin', 'Shah', 'kevin.shah@gmail.com', 9604930271, 'M', 72, 14, 'South Carolina'),
('David', 'Silva', 'david.silva@orkut.com', 7318477862, 'M', 29, 5, 'New York'),
('Joshua', 'Maddox', 'joshua.maddox@hotmail.com', 3542051951, 'F', 84, 4, 'North Carolina'),
('Anna', 'Le', 'anna.le@orkut.com', 6645432599, 'M', 37, 3, 'North Carolina'),
('Matthew', 'Fowler', 'matthew.fowler@hotmail.com', 5230176715, 'M', 92, 7, 'North Carolina'),
('Eugene', 'Price', 'eugene.price@gmail.com', 8575175607, 'M', 64, 6, 'Maryland'),
('Stephanie', 'Griffin', 'stephanie.griffin@orkut.com', 1081346012, 'M', 86, 7, 'North Carolina'),
('John', 'Hunter', 'john.hunter@yahoo.com', 7954317139, 'M', 36, 7, 'North Carolina'),
('Bill', 'Koch', 'bill.koch@orkut.com', 9329887272, 'F', 56, 13, 'Ohio'),
('Timothy', 'Morgan', 'timothy.morgan@hotmail.com', 3257907630, 'F', 36, 8, 'Pennsylvania'),
('Brianna', 'Wu', 'brianna.wu@gmail.com', 6212497035, 'M', 9, 11, 'Maine'),
('Sheila', 'Lewis', 'sheila.lewis@hotmail.com', 7955335233, 'F', 21, 8, 'New York'),
('Christopher', 'Martin', 'christopher.martin@orkut.com', 8495546080, 'M', 71, 12, 'North Carolina'),
('Tara', 'Long', 'tara.long@gmail.com', 4184631575, 'M', 38, 9, 'Ohio'),
('Matthew', 'Mason', 'matthew.mason@yahoo.com', 9835341380, 'F', 52, 6, 'New York'),
('Richard', 'Foster', 'richard.foster@yahoo.com', 7924802265, 'M', 71, 8, 'Pennsylvania'),
('Nicole', 'Leonard', 'nicole.leonard@yahoo.com', 5391970945, 'M', 84, 1, 'Hawaii'),
('Kristen', 'Castaneda', 'kristen.castaneda@orkut.com', 1749266843, 'M', 72, 1, 'Pennsylvania'),
('Nancy', 'Shea', 'nancy.shea@hotmail.com', 8517966457, 'F', 89, 12, 'New Hampshire'),
('Morgan', 'Townsend', 'morgan.townsend@orkut.com', 8023121611, 'M', 60, 11, 'New York'),
('Lindsey', 'Henderson', 'lindsey.henderson@yahoo.com', 2874369634, 'M', 49, 14, 'Ohio'),
('Charles', 'Roberson', 'charles.roberson@orkut.com', 1880471368, 'F', 17, 3, 'North Carolina'),
('Makayla', 'Freeman', 'makayla.freeman@gmail.com', 9389135354, 'M', 62, 3, 'North Carolina'),
('Karen', 'Leonard', 'karen.leonard@gmail.com', 3792579030, 'M', 80, 1, 'Pennsylvania'),
('Jeffrey', 'Parks', 'jeffrey.parks@yahoo.com', 3740769586, 'F', 47, 12, 'Maine'),
('Brandon', 'Smith', 'brandon.smith@orkut.com', 6796577715, 'M', 47, 8, 'Florida'),
('Brittney', 'Cook', 'brittney.cook@gmail.com', 4355601785, 'M', 54, 8, 'Pennsylvania'),
('Rodney', 'Zimmerman', 'rodney.zimmerman@gmail.com', 2819682802, 'F', 84, 3, 'Wisconsin'),
('Tina', 'Scott', 'tina.scott@hotmail.com', 1784386784, 'F', 25, 1, 'Mississippi'),
('Jessica', 'Dennis', 'jessica.dennis@yahoo.com', 9196469959, 'M', 80, 11, 'Ohio'),
('Sheila', 'Hardin', 'sheila.hardin@orkut.com', 3803764111, 'F', 34, 12, 'Louisiana'),
('Kristin', 'Logan', 'kristin.logan@gmail.com', 5086261460, 'M', 53, 11, 'North Carolina'),
('Mark', 'Collins', 'mark.collins@gmail.com', 7274250898, 'F', 66, 6, 'New York'),
('David', 'Warner', 'david.warner@yahoo.com', 2530028691, 'M', 81, 2, 'Utah'),
('Kelly', 'Martinez', 'kelly.martinez@yahoo.com', 8848402787, 'M', 29, 10, 'New York'),
('Michelle', 'Holt', 'michelle.holt@hotmail.com', 4165691048, 'M', 91, 12, 'New York'),
('Andrew', 'Stewart', 'andrew.stewart@gmail.com', 3968841916, 'M', 87, 8, 'North Carolina'),
('Suzanne', 'Bradshaw', 'suzanne.bradshaw@orkut.com', 9916875991, 'F', 69, 8, 'New York'),
('Donald', 'Powell', 'donald.powell@orkut.com', 3942236625, 'F', 12, 10, 'Michigan'),
('Krista', 'Skinner', 'krista.skinner@hotmail.com', 7148467604, 'M', 7, 6, 'New York'),
('Laura', 'Charles', 'laura.charles@yahoo.com', 9659383466, 'M', 64, 12, 'Ohio'),
('Andrea', 'Anderson', 'andrea.anderson@orkut.com', 2160227298, 'M', 42, 1, 'Maine'),
('Andrew', 'Cruz', 'andrew.cruz@gmail.com', 1447281971, 'M', 55, 13, 'Maine'),
('Russell', 'Brooks', 'russell.brooks@orkut.com', 1859911940, 'F', 56, 6, 'North Carolina'),
('Heather', 'Brown', 'heather.brown@gmail.com', 5543367172, 'F', 25, 14, 'New York'),
('Jodi', 'Estrada', 'jodi.estrada@gmail.com', 2074391364, 'F', 35, 3, 'Pennsylvania'),
('Timothy', 'Berry', 'timothy.berry@yahoo.com', 3845571338, 'M', 44, 2, 'Maine'),
('Philip', 'Wagner', 'philip.wagner@hotmail.com', 2698076625, 'M', 92, 9, 'Ohio'),
('Regina', 'Ochoa', 'regina.ochoa@gmail.com', 3784391832, 'M', 5, 2, 'Pennsylvania'),
('Kelly', 'Jones', 'kelly.jones@orkut.com', 7688628567, 'M', 85, 7, 'Maine'),
('Ariana', 'Norman', 'ariana.norman@gmail.com', 7846938596, 'M', 64, 3, 'New Hampshire'),
('Debra', 'Conner', 'debra.conner@orkut.com', 1483062583, 'F', 9, 2, 'Maine'),
('Deborah', 'Brown', 'deborah.brown@gmail.com', 7439986775, 'M', 32, 8, 'Maine'),
('Nicholas', 'Rush', 'nicholas.rush@orkut.com', 4113859751, 'F', 90, 2, 'Pennsylvania'),
('Steven', 'Cook', 'steven.cook@orkut.com', 1418880459, 'F', 87, 13, 'Pennsylvania'),
('Derek', 'Wilson', 'derek.wilson@orkut.com', 7993707742, 'F', 58, 12, 'Maine'),
('Pam', 'Watson', 'pam.watson@yahoo.com', 4911198813, 'F', 14, 6, 'Pennsylvania'),
('David', 'Ray', 'david.ray@gmail.com', 6586037984, 'F', 14, 8, 'Maine'),
('William', 'Parker', 'william.parker@hotmail.com', 2337587154, 'F', 27, 11, 'North Carolina'),
('Kimberly', 'Stevens', 'kimberly.stevens@gmail.com', 1301534343, 'F', 40, 7, 'Ohio'),
('Mark', 'Cruz', 'mark.cruz@gmail.com', 5243409272, 'F', 85, 13, 'Georgia'),
('Scott', 'Chen', 'scott.chen@gmail.com', 2856874730, 'F', 84, 10, 'Pennsylvania'),
('Stephanie', 'Perez', 'stephanie.perez@gmail.com', 4422662698, 'F', 15, 6, 'Texas'),
('Summer', 'Dixon', 'summer.dixon@hotmail.com', 4425231467, 'M', 24, 11, 'Delaware'),
('Scott', 'Guerra', 'scott.guerra@yahoo.com', 4952663369, 'M', 90, 12, 'Ohio'),
('Ashley', 'Thomas', 'ashley.thomas@gmail.com', 4887684891, 'M', 35, 3, 'Montana'),
('Amanda', 'Carpenter', 'amanda.carpenter@gmail.com', 8198257425, 'M', 82, 12, 'Pennsylvania'),
('Jacob', 'Hopkins', 'jacob.hopkins@yahoo.com', 4286991803, 'M', 82, 6, 'Ohio'),
('Donna', 'Moore', 'donna.moore@hotmail.com', 3779242911, 'F', 37, 2, 'New Jersey'),
('Ryan', 'Walker', 'ryan.walker@yahoo.com', 3453430581, 'F', 62, 6, 'New York'),
('Emily', 'Higgins', 'emily.higgins@hotmail.com', 9744151733, 'M', 14, 9, 'Minnesota'),
('Crystal', 'Marshall', 'crystal.marshall@orkut.com', 8673400286, 'F', 29, 12, 'Delaware'),
('Erik', 'Barrera', 'erik.barrera@hotmail.com', 8181733937, 'M', 31, 8, 'North Carolina'),
('Carla', 'Fox', 'carla.fox@gmail.com', 2505385896, 'M', 91, 9, 'Maine'),
('Willie', 'Arnold', 'willie.arnold@yahoo.com', 5502375715, 'M', 45, 12, 'Maryland'),
('Christopher', 'Miller', 'christopher.miller@yahoo.com', 9843681771, 'F', 67, 1, 'Maine'),
('Leslie', 'Riley', 'leslie.riley@hotmail.com', 7497158974, 'F', 28, 5, 'North Carolina'),
('Kevin', 'Ayala', 'kevin.ayala@orkut.com', 8296943956, 'F', 5, 3, 'Pennsylvania'),
('Jeffrey', 'Collins', 'jeffrey.collins@hotmail.com', 5829324931, 'F', 70, 9, 'Connecticut'),
('Elizabeth', 'Griffith', 'elizabeth.griffith@gmail.com', 6365871748, 'F', 6, 10, 'Ohio'),
('Eric', 'Thornton', 'eric.thornton@hotmail.com', 8497874651, 'F', 54, 8, 'South Carolina'),
('Jonathan', 'Baker', 'jonathan.baker@orkut.com', 5995080552, 'F', 74, 3, 'Pennsylvania'),
('Joshua', 'Spencer', 'joshua.spencer@orkut.com', 4060739976, 'F', 15, 11, 'New York'),
('Kelsey', 'Bernard', 'kelsey.bernard@gmail.com', 7377455927, 'F', 12, 6, 'Pennsylvania'),
('Robert', 'Decker', 'robert.decker@orkut.com', 6614660232, 'M', 20, 4, 'New York'),
('Brett', 'Rivera', 'brett.rivera@hotmail.com', 6259866235, 'M', 94, 1, 'North Carolina'),
('Eileen', 'Mills', 'eileen.mills@gmail.com', 3512186653, 'F', 76, 8, 'Ohio'),
('Kristin', 'Evans', 'kristin.evans@orkut.com', 8276473876, 'M', 6, 7, 'North Carolina'),
('Ashley', 'Duncan', 'ashley.duncan@orkut.com', 5183505433, 'F', 19, 10, 'North Carolina'),
('Craig', 'Richardson', 'craig.richardson@orkut.com', 8600239365, 'F', 72, 5, 'New York'),
('Bryce', 'Roberts', 'bryce.roberts@orkut.com', 1838862030, 'F', 48, 11, 'Mississippi'),
('Brenda', 'Snyder', 'brenda.snyder@orkut.com', 5244065292, 'M', 54, 6, 'Maine'),
('William', 'Vaughn', 'william.vaughn@hotmail.com', 2370035786, 'F', 92, 13, 'Ohio'),
('Sarah', 'Zuniga', 'sarah.zuniga@gmail.com', 9333616794, 'F', 85, 11, 'Maine'),
('Michelle', 'Fox', 'michelle.fox@orkut.com', 1549186041, 'F', 88, 8, 'New York'),
('Anthony', 'Smith', 'anthony.smith@hotmail.com', 2026766810, 'F', 61, 8, 'New York'),
('Amanda', 'Ramos', 'amanda.ramos@orkut.com', 1792801457, 'F', 92, 4, 'North Carolina'),
('Felicia', 'Berry', 'felicia.berry@orkut.com', 3578553707, 'F', 80, 11, 'Maine'),
('Angela', 'Davis', 'angela.davis@yahoo.com', 9303787068, 'F', 10, 4, 'North Carolina'),
('Philip', 'Johnson', 'philip.johnson@yahoo.com', 5492701479, 'M', 20, 14, 'North Carolina'),
('Bradley', 'Peterson', 'bradley.peterson@yahoo.com', 8479716538, 'M', 60, 4, 'Pennsylvania'),
('Charles', 'Wong', 'charles.wong@hotmail.com', 9395132339, 'M', 15, 7, 'Ohio'),
('Miguel', 'Carey', 'miguel.carey@gmail.com', 9301582030, 'M', 19, 12, 'Pennsylvania'),
('Jennifer', 'Travis', 'jennifer.travis@yahoo.com', 1668121455, 'F', 47, 6, 'Ohio'),
('Regina', 'Nguyen', 'regina.nguyen@hotmail.com', 2728459802, 'M', 48, 13, 'Arkansas'),
('Lisa', 'Molina', 'lisa.molina@orkut.com', 1346617549, 'F', 73, 9, 'Pennsylvania'),
('Matthew', 'Miranda', 'matthew.miranda@orkut.com', 9489357195, 'F', 95, 2, 'North Carolina'),
('Alexis', 'Gonzalez', 'alexis.gonzalez@gmail.com', 7494750308, 'F', 46, 4, 'North Carolina'),
('Jason', 'Mejia', 'jason.mejia@gmail.com', 7828673334, 'F', 9, 13, 'North Carolina'),
('Grant', 'Scott', 'grant.scott@gmail.com', 8065047287, 'M', 71, 8, 'North Carolina'),
('David', 'Carney', 'david.carney@gmail.com', 4648009250, 'M', 84, 6, 'Mississippi'),
('Susan', 'Singh', 'susan.singh@orkut.com', 1070025109, 'F', 60, 13, 'Ohio'),
('Tony', 'Barrett', 'tony.barrett@hotmail.com', 5098393602, 'F', 6, 3, 'North Carolina'),
('Donna', 'Jimenez', 'donna.jimenez@gmail.com', 4868337295, 'F', 7, 13, 'New York'),
('Jennifer', 'Salazar', 'jennifer.salazar@yahoo.com', 3465478124, 'M', 93, 9, 'Connecticut'),
('Jeffrey', 'Lane', 'jeffrey.lane@orkut.com', 4409469624, 'M', 49, 9, 'Connecticut'),
('Jason', 'Monroe', 'jason.monroe@gmail.com', 5296206172, 'F', 72, 8, 'North Carolina'),
('Johnny', 'Williams', 'johnny.williams@hotmail.com', 9368614313, 'F', 47, 7, 'Alabama'),
('James', 'Brown', 'james.brown@orkut.com', 3217968014, 'F', 83, 12, 'New York'),
('Andrew', 'Davis', 'andrew.davis@yahoo.com', 5847901432, 'M', 5, 12, 'North Carolina'),
('Lori', 'Hurley', 'lori.hurley@yahoo.com', 8524564586, 'F', 6, 8, 'North Carolina'),
('Jake', 'Tran', 'jake.tran@gmail.com', 3161497287, 'F', 94, 1, 'North Carolina'),
('Amanda', 'Olsen', 'amanda.olsen@hotmail.com', 5874250802, 'F', 59, 2, 'Wyoming'),
('Sharon', 'Hughes', 'sharon.hughes@yahoo.com', 6290482049, 'F', 44, 7, 'South Dakota'),
('John', 'Parker', 'john.parker@hotmail.com', 8671247986, 'F', 57, 1, 'New York'),
('Kimberly', 'Stephens', 'kimberly.stephens@gmail.com', 6320096349, 'F', 26, 13, 'New York'),
('Robert', 'Stone', 'robert.stone@hotmail.com', 6069661380, 'F', 86, 6, 'North Carolina'),
('Sherry', 'Stewart', 'sherry.stewart@yahoo.com', 8011171977, 'M', 15, 13, 'Maine'),
('Linda', 'Kent', 'linda.kent@hotmail.com', 7738758378, 'M', 69, 9, 'Colorado'),
('Paul', 'Frazier', 'paul.frazier@orkut.com', 2033194279, 'M', 70, 2, 'Pennsylvania'),
('Alison', 'Schneider', 'alison.schneider@orkut.com', 8425607118, 'F', 25, 2, 'Maine'),
('Andre', 'Martinez', 'andre.martinez@hotmail.com', 3904972375, 'F', 75, 11, 'Ohio'),
('Diana', 'Miller', 'diana.miller@hotmail.com', 7686977074, 'F', 85, 4, 'New York'),
('Melissa', 'Houston', 'melissa.houston@hotmail.com', 7304023607, 'M', 21, 9, 'North Carolina'),
('Louis', 'Wilson', 'louis.wilson@gmail.com', 7737967114, 'F', 28, 14, 'Pennsylvania'),
('Brenda', 'Sloan', 'brenda.sloan@gmail.com', 6856181096, 'M', 26, 13, 'North Carolina'),
('Ronald', 'Morgan', 'ronald.morgan@yahoo.com', 5484763504, 'M', 78, 14, 'North Carolina'),
('Krystal', 'Bowers', 'krystal.bowers@gmail.com', 2632604439, 'F', 65, 9, 'Vermont'),
('Eric', 'Davenport', 'eric.davenport@orkut.com', 9952553477, 'M', 24, 4, 'Pennsylvania'),
('Sarah', 'Ford', 'sarah.ford@orkut.com', 3949721474, 'M', 78, 1, 'Arizona'),
('Kelly', 'Hunt', 'kelly.hunt@hotmail.com', 4154615319, 'F', 22, 3, 'Alaska'),
('Paula', 'Smith', 'paula.smith@yahoo.com', 5776318561, 'F', 28, 6, 'Pennsylvania'),
('Jon', 'Allen', 'jon.allen@orkut.com', 4480124061, 'M', 62, 6, 'Ohio'),
('Scott', 'Hayes', 'scott.hayes@hotmail.com', 7182371214, 'M', 53, 10, 'Pennsylvania'),
('Krystal', 'Edwards', 'krystal.edwards@orkut.com', 5117409115, 'M', 71, 7, 'Louisiana'),
('Clayton', 'Sanders', 'clayton.sanders@hotmail.com', 6409988653, 'F', 28, 8, 'Ohio'),
('Jennifer', 'Conner', 'jennifer.conner@yahoo.com', 3790764212, 'F', 70, 10, 'South Carolina'),
('Stephen', 'Garcia', 'stephen.garcia@yahoo.com', 3320790489, 'F', 11, 6, 'Washington'),
('Noah', 'Hull', 'noah.hull@yahoo.com', 4886290102, 'F', 72, 3, 'Nebraska'),
('Michael', 'Powell', 'michael.powell@gmail.com', 5118004493, 'F', 7, 2, 'Maine'),
('Mario', 'Nelson', 'mario.nelson@hotmail.com', 8851901226, 'F', 26, 6, 'Idaho'),
('Mary', 'Jensen', 'mary.jensen@yahoo.com', 8184615148, 'M', 87, 13, 'Pennsylvania'),
('Russell', 'Cooper', 'russell.cooper@hotmail.com', 3635971384, 'M', 11, 2, 'Vermont'),
('Anthony', 'Jones', 'anthony.jones@yahoo.com', 8442396653, 'M', 63, 14, 'Kentucky'),
('Jonathan', 'Lopez', 'jonathan.lopez@hotmail.com', 6890052372, 'F', 35, 3, 'North Carolina'),
('Nancy', 'Liu', 'nancy.liu@gmail.com', 9691383664, 'F', 27, 5, 'Minnesota'),
('Denise', 'Mendez', 'denise.mendez@hotmail.com', 8952780544, 'F', 41, 8, 'North Carolina'),
('Michael', 'Velasquez', 'michael.velasquez@hotmail.com', 2689017541, 'F', 62, 4, 'New York'),
('Paula', 'Stewart', 'paula.stewart@gmail.com', 4157579581, 'F', 12, 11, 'Ohio'),
('Toni', 'Washington', 'toni.washington@gmail.com', 5287949387, 'M', 47, 13, 'North Carolina'),
('Samuel', 'Holmes', 'samuel.holmes@orkut.com', 6034936175, 'M', 83, 2, 'Pennsylvania'),
('Kathy', 'Salas', 'kathy.salas@hotmail.com', 9633553313, 'F', 91, 5, 'Maine'),
('Sean', 'Gaines', 'sean.gaines@orkut.com', 6691693370, 'F', 90, 12, 'North Carolina'),
('Jennifer', 'Lopez', 'jennifer.lopez@hotmail.com', 2650425788, 'M', 75, 6, 'Ohio'),
('Danny', 'Nunez', 'danny.nunez@hotmail.com', 2548405813, 'M', 23, 3, 'Ohio'),
('Francisco', 'Murray', 'francisco.murray@gmail.com', 3303842729, 'F', 27, 14, 'New York'),
('Philip', 'Munoz', 'philip.munoz@hotmail.com', 7491732624, 'F', 77, 10, 'New York'),
('Wendy', 'Wilson', 'wendy.wilson@yahoo.com', 2303835911, 'F', 62, 4, 'New York'),
('Valerie', 'Peters', 'valerie.peters@hotmail.com', 5361898736, 'F', 93, 9, 'Ohio'),
('Michael', 'Hernandez', 'michael.hernandez@gmail.com', 5538927440, 'F', 70, 14, 'Ohio'),
('Martin', 'Davenport', 'martin.davenport@orkut.com', 2676546685, 'M', 39, 2, 'New York'),
('Miguel', 'Dodson', 'miguel.dodson@hotmail.com', 7644551424, 'F', 8, 10, 'Ohio'),
('Kevin', 'Griffith', 'kevin.griffith@gmail.com', 7168244812, 'F', 93, 3, 'Pennsylvania'),
('Madison', 'Sparks', 'madison.sparks@gmail.com', 9243400937, 'F', 17, 10, 'Utah'),
('Patrick', 'Hartman', 'patrick.hartman@gmail.com', 7371019142, 'F', 36, 12, 'New York'),
('John', 'Walker', 'john.walker@gmail.com', 1279071062, 'F', 36, 9, 'Ohio'),
('Tyrone', 'Franklin', 'tyrone.franklin@orkut.com', 9698317961, 'F', 85, 5, 'Kansas'),
('Samantha', 'Buchanan', 'samantha.buchanan@orkut.com', 3951530244, 'F', 48, 1, 'Pennsylvania'),
('William', 'Bowman', 'william.bowman@gmail.com', 6529673152, 'M', 51, 12, 'New York'),
('George', 'Shaffer', 'george.shaffer@hotmail.com', 7771207497, 'F', 24, 9, 'New York'),
('Patrick', 'Bridges', 'patrick.bridges@yahoo.com', 6562507562, 'F', 85, 8, 'Pennsylvania'),
('Teresa', 'Rowe', 'teresa.rowe@yahoo.com', 6192584403, 'M', 63, 3, 'North Carolina'),
('Jessica', 'Vincent', 'jessica.vincent@yahoo.com', 6218687832, 'F', 67, 3, 'Pennsylvania'),
('Mark', 'Stewart', 'mark.stewart@yahoo.com', 5198878942, 'M', 60, 7, 'Maine'),
('Jonathan', 'Garcia', 'jonathan.garcia@orkut.com', 2999809447, 'F', 39, 5, 'Ohio'),
('Joseph', 'Martin', 'joseph.martin@orkut.com', 5041947708, 'M', 14, 1, 'Pennsylvania'),
('Caitlin', 'Smith', 'caitlin.smith@hotmail.com', 2456521336, 'F', 59, 10, 'Pennsylvania'),
('Carrie', 'Fisher', 'carrie.fisher@orkut.com', 7146789537, 'F', 25, 12, 'North Carolina'),
('Wendy', 'Davis', 'wendy.davis@gmail.com', 7049620709, 'F', 89, 1, 'New Hampshire'),
('Sarah', 'Rios', 'sarah.rios@hotmail.com', 7113938056, 'F', 44, 14, 'New York'),
('Stacy', 'Jones', 'stacy.jones@orkut.com', 4563040856, 'M', 49, 2, 'North Carolina'),
('Jeffery', 'Jackson', 'jeffery.jackson@gmail.com', 1490784046, 'F', 48, 10, 'New York'),
('Adam', 'Steele', 'adam.steele@hotmail.com', 4460146060, 'M', 22, 10, 'Pennsylvania'),
('Jennifer', 'Fields', 'jennifer.fields@yahoo.com', 1814669574, 'M', 88, 12, 'North Carolina'),
('Laurie', 'Black', 'laurie.black@orkut.com', 3907484132, 'M', 24, 4, 'Nebraska'),
('Justin', 'Wilson', 'justin.wilson@yahoo.com', 1088135466, 'F', 33, 13, 'South Carolina'),
('Timothy', 'King', 'timothy.king@hotmail.com', 2258882815, 'F', 91, 4, 'Hawaii'),
('Steven', 'Berry', 'steven.berry@yahoo.com', 3978382549, 'F', 33, 3, 'North Carolina'),
('Brandi', 'King', 'brandi.king@yahoo.com', 7463620659, 'F', 52, 11, 'Pennsylvania'),
('Christine', 'Tyler', 'christine.tyler@yahoo.com', 9148621921, 'M', 56, 5, 'Arizona'),
('Timothy', 'Shepherd', 'timothy.shepherd@gmail.com', 5897100344, 'F', 71, 2, 'New York'),
('Robert', 'Cunningham', 'robert.cunningham@orkut.com', 5318498495, 'F', 15, 3, 'Washington'),
('Kathryn', 'Lin', 'kathryn.lin@gmail.com', 1165057423, 'M', 67, 3, 'North Carolina'),
('Stephen', 'Robinson', 'stephen.robinson@yahoo.com', 7655852814, 'F', 57, 3, 'Oregon'),
('Kelly', 'Chang', 'kelly.chang@orkut.com', 9992340729, 'F', 18, 1, 'Rhode Island'),
('Bonnie', 'Miller', 'bonnie.miller@gmail.com', 2948776355, 'F', 66, 13, 'Ohio'),
('Valerie', 'Sanchez', 'valerie.sanchez@hotmail.com', 8248916679, 'F', 40, 5, 'North Carolina'),
('Angela', 'Reyes', 'angela.reyes@yahoo.com', 3436405298, 'M', 83, 3, 'Maryland'),
('Jerry', 'Camacho', 'jerry.camacho@gmail.com', 4272634785, 'F', 72, 13, 'Oregon'),
('Robert', 'Moody', 'robert.moody@hotmail.com', 8595959581, 'M', 38, 2, 'Ohio'),
('Karen', 'Graham', 'karen.graham@hotmail.com', 6534577874, 'F', 79, 7, 'Oregon'),
('Steven', 'Alvarado', 'steven.alvarado@hotmail.com', 6174659183, 'M', 85, 4, 'New York'),
('Bradley', 'Potter', 'bradley.potter@yahoo.com', 5619164004, 'F', 27, 14, 'Oregon'),
('Kevin', 'Bush', 'kevin.bush@yahoo.com', 1397297763, 'F', 79, 6, 'Maine'),
('Dustin', 'Jones', 'dustin.jones@yahoo.com', 7193985732, 'M', 62, 8, 'New York'),
('Meghan', 'Miller', 'meghan.miller@yahoo.com', 7899747604, 'F', 82, 14, 'North Dakota'),
('Tina', 'Bennett', 'tina.bennett@yahoo.com', 3245818281, 'F', 55, 6, 'Indiana'),
('Michael', 'Collins', 'michael.collins@yahoo.com', 9360101797, 'M', 60, 14, 'New York'),
('Virginia', 'Decker', 'virginia.decker@yahoo.com', 7371391069, 'M', 94, 8, 'Ohio'),
('William', 'Becker', 'william.becker@gmail.com', 1325615160, 'F', 91, 1, 'Ohio'),
('Chad', 'Wood', 'chad.wood@gmail.com', 1099104049, 'M', 92, 6, 'North Carolina'),
('Lauren', 'Harris', 'lauren.harris@yahoo.com', 2077916616, 'F', 71, 8, 'New Hampshire'),
('Amy', 'Montgomery', 'amy.montgomery@gmail.com', 6571341742, 'F', 67, 9, 'Maine'),
('Krista', 'Frank', 'krista.frank@yahoo.com', 4260924223, 'F', 68, 7, 'Pennsylvania'),
('Belinda', 'Fuller', 'belinda.fuller@gmail.com', 8531257592, 'F', 10, 2, 'North Carolina'),
('Xavier', 'Nielsen', 'xavier.nielsen@gmail.com', 5317326303, 'M', 50, 14, 'Oregon'),
('Sandra', 'Gonzalez', 'sandra.gonzalez@hotmail.com', 5977503234, 'M', 17, 10, 'New York'),
('Jennifer', 'Rodriguez', 'jennifer.rodriguez@yahoo.com', 9887173843, 'F', 65, 7, 'Maine'),
('Kyle', 'Murray', 'kyle.murray@gmail.com', 4832234728, 'F', 12, 3, 'Ohio'),
('Meredith', 'Mcpherson', 'meredith.mcpherson@gmail.com', 1721941683, 'M', 51, 8, 'North Carolina'),
('Laura', 'Newman', 'laura.newman@hotmail.com', 2986531116, 'F', 8, 1, 'Ohio'),
('Brandon', 'Brooks', 'brandon.brooks@hotmail.com', 3743599850, 'F', 86, 12, 'New York'),
('Jamie', 'Anderson', 'jamie.anderson@orkut.com', 3393050275, 'M', 45, 8, 'New York'),
('Ashley', 'Frazier', 'ashley.frazier@hotmail.com', 4156091503, 'F', 84, 2, 'Ohio'),
('Christopher', 'Phillips', 'christopher.phillips@yahoo.com', 9099481723, 'M', 83, 6, 'Vermont'),
('Tyler', 'Fowler', 'tyler.fowler@yahoo.com', 5102675203, 'M', 65, 11, 'Rhode Island'),
('Brian', 'Williams', 'brian.williams@orkut.com', 9743460901, 'M', 37, 5, 'Ohio'),
('Tiffany', 'Soto', 'tiffany.soto@yahoo.com', 8283202692, 'M', 43, 9, 'Pennsylvania'),
('David', 'Gutierrez', 'david.gutierrez@yahoo.com', 9009161833, 'M', 65, 5, 'North Carolina'),
('Ashley', 'Avila', 'ashley.avila@hotmail.com', 1274443194, 'F', 93, 7, 'North Carolina'),
('Wesley', 'Pittman', 'wesley.pittman@hotmail.com', 1732340819, 'M', 22, 11, 'Pennsylvania'),
('Kelly', 'Martinez', 'kelly.martinez@gmail.com', 4448234433, 'M', 86, 13, 'Ohio'),
('Keith', 'Huang', 'keith.huang@hotmail.com', 5902384124, 'M', 5, 2, 'Ohio'),
('Gregory', 'Davis', 'gregory.davis@orkut.com', 2289525816, 'F', 30, 12, 'Louisiana'),
('William', 'Jackson', 'william.jackson@hotmail.com', 9212541627, 'M', 86, 8, 'Ohio'),
('Dana', 'Terry', 'dana.terry@hotmail.com', 8445406683, 'M', 67, 3, 'Alaska'),
('Joseph', 'Sparks', 'joseph.sparks@orkut.com', 6628875395, 'M', 47, 12, 'North Carolina'),
('Steven', 'Phillips', 'steven.phillips@yahoo.com', 6689464458, 'F', 6, 13, 'Pennsylvania'),
('Gina', 'Watts', 'gina.watts@gmail.com', 8340938420, 'M', 17, 12, 'Pennsylvania'),
('Gina', 'Olson', 'gina.olson@yahoo.com', 2226904399, 'M', 49, 2, 'New York'),
('Carolyn', 'Davis', 'carolyn.davis@hotmail.com', 5274150039, 'M', 19, 4, 'New York'),
('Jeremy', 'Harris', 'jeremy.harris@hotmail.com', 2986104772, 'M', 7, 1, 'South Dakota'),
('Michael', 'Wells', 'michael.wells@hotmail.com', 3418405818, 'F', 95, 1, 'Maine'),
('Paul', 'Barnes', 'paul.barnes@yahoo.com', 2419597090, 'M', 46, 9, 'Ohio'),
('Brandy', 'Lynch', 'brandy.lynch@yahoo.com', 2207768038, 'F', 92, 6, 'Maine'),
('Brendan', 'Montgomery', 'brendan.montgomery@orkut.com', 4179763850, 'F', 20, 4, 'Maine'),
('Corey', 'Johnson', 'corey.johnson@orkut.com', 4431345078, 'F', 26, 3, 'New York'),
('Christopher', 'Smith', 'christopher.smith@orkut.com', 2058505434, 'M', 36, 7, 'Maine'),
('Chase', 'Welch', 'chase.welch@yahoo.com', 3103494490, 'F', 16, 3, 'New York'),
('Donna', 'Buchanan', 'donna.buchanan@orkut.com', 5526900908, 'F', 83, 2, 'Ohio'),
('Dale', 'Miller', 'dale.miller@yahoo.com', 8275999717, 'F', 28, 6, 'Pennsylvania'),
('Jennifer', 'Grant', 'jennifer.grant@yahoo.com', 9909688112, 'M', 73, 9, 'Ohio'),
('Stephen', 'Walker', 'stephen.walker@hotmail.com', 9502430781, 'F', 81, 11, 'Ohio'),
('Brendan', 'Griffith', 'brendan.griffith@yahoo.com', 7724288133, 'F', 90, 1, 'North Carolina'),
('Blake', 'Zavala', 'blake.zavala@orkut.com', 8083686626, 'M', 92, 12, 'New Mexico'),
('Jennifer', 'Bray', 'jennifer.bray@orkut.com', 6009243294, 'M', 78, 10, 'Pennsylvania'),
('Kathryn', 'Mendoza', 'kathryn.mendoza@gmail.com', 7521962781, 'F', 71, 4, 'Pennsylvania'),
('John', 'Kelley', 'john.kelley@hotmail.com', 8864355615, 'F', 95, 11, 'Maine'),
('Tara', 'Bailey', 'tara.bailey@hotmail.com', 6243701803, 'M', 88, 8, 'Maine'),
('Robert', 'Moody', 'robert.moody@gmail.com', 5512656623, 'M', 55, 5, 'Oregon'),
('Keith', 'Tucker', 'keith.tucker@orkut.com', 4679790547, 'M', 57, 6, 'Oregon'),
('Jamie', 'Nash', 'jamie.nash@gmail.com', 6396818024, 'M', 74, 1, 'Ohio'),
('Tracy', 'Nguyen', 'tracy.nguyen@yahoo.com', 6427446502, 'M', 69, 5, 'Pennsylvania'),
('Rebecca', 'Bailey', 'rebecca.bailey@hotmail.com', 9149493179, 'M', 71, 8, 'Florida'),
('Edward', 'Walters', 'edward.walters@hotmail.com', 2863193070, 'F', 33, 12, 'Pennsylvania'),
('Jennifer', 'Taylor', 'jennifer.taylor@gmail.com', 9570933771, 'F', 95, 8, 'Maine'),
('Jimmy', 'Williams', 'jimmy.williams@hotmail.com', 7523860469, 'M', 82, 6, 'North Carolina'),
('Katherine', 'Sparks', 'katherine.sparks@gmail.com', 7862610451, 'F', 60, 7, 'Pennsylvania'),
('Terri', 'Gomez', 'terri.gomez@yahoo.com', 9051278092, 'M', 46, 1, 'Pennsylvania'),
('Julie', 'Burke', 'julie.burke@hotmail.com', 1115946111, 'F', 24, 6, 'Ohio'),
('Barbara', 'Harris', 'barbara.harris@gmail.com', 4961509089, 'F', 48, 1, 'Michigan'),
('Sara', 'Noble', 'sara.noble@gmail.com', 1848656433, 'M', 7, 14, 'Ohio'),
('Rebecca', 'Mooney', 'rebecca.mooney@gmail.com', 7538721121, 'M', 25, 12, 'Rhode Island'),
('Bradley', 'Dudley', 'bradley.dudley@hotmail.com', 2810393254, 'F', 55, 2, 'South Carolina'),
('Nathan', 'Shields', 'nathan.shields@yahoo.com', 9503274215, 'F', 36, 5, 'Ohio'),
('Kevin', 'Daniel', 'kevin.daniel@orkut.com', 3575111067, 'M', 8, 1, 'Idaho'),
('Juan', 'Pratt', 'juan.pratt@orkut.com', 7431765600, 'M', 15, 14, 'Mississippi'),
('Michael', 'Robinson', 'michael.robinson@hotmail.com', 5185185950, 'F', 32, 6, 'Maine'),
('Alicia', 'Gutierrez', 'alicia.gutierrez@orkut.com', 2060862508, 'M', 32, 8, 'Maryland'),
('Brett', 'Melton', 'brett.melton@orkut.com', 8619863867, 'F', 54, 12, 'South Carolina'),
('Jonathan', 'Smith', 'jonathan.smith@orkut.com', 6222395038, 'F', 63, 14, 'Maine'),
('Laura', 'Washington', 'laura.washington@gmail.com', 5964110179, 'F', 57, 10, 'Maine'),
('Dennis', 'Cole', 'dennis.cole@yahoo.com', 4485507780, 'M', 85, 2, 'Oregon'),
('Robert', 'Prince', 'robert.prince@yahoo.com', 5230339780, 'F', 65, 9, 'New York'),
('Kevin', 'Miles', 'kevin.miles@gmail.com', 4394227803, 'F', 9, 8, 'Florida'),
('Vincent', 'Long', 'vincent.long@gmail.com', 2330907312, 'F', 7, 7, 'Pennsylvania'),
('Logan', 'Mccoy', 'logan.mccoy@hotmail.com', 2916561155, 'F', 82, 7, 'North Carolina'),
('Patricia', 'Pace', 'patricia.pace@yahoo.com', 9074720727, 'F', 20, 2, 'Vermont'),
('Brianna', 'Adams', 'brianna.adams@gmail.com', 7062791903, 'M', 23, 6, 'Oregon'),
('Paula', 'Sullivan', 'paula.sullivan@gmail.com', 8424574782, 'F', 51, 5, 'North Carolina'),
('Molly', 'Ryan', 'molly.ryan@hotmail.com', 4654054653, 'F', 44, 9, 'Arizona'),
('Cassandra', 'Christian', 'cassandra.christian@hotmail.com', 6644039149, 'M', 86, 7, 'Ohio'),
('Donald', 'Mills', 'donald.mills@hotmail.com', 8169498957, 'F', 45, 7, 'Ohio'),
('Amy', 'Scott', 'amy.scott@gmail.com', 5532725761, 'M', 33, 4, 'Pennsylvania'),
('Denise', 'Burns', 'denise.burns@hotmail.com', 1278971824, 'M', 42, 6, 'Ohio'),
('Sarah', 'Turner', 'sarah.turner@orkut.com', 5065945132, 'M', 56, 4, 'Washington'),
('Natasha', 'Patel', 'natasha.patel@gmail.com', 7248546645, 'M', 55, 13, 'North Carolina'),
('Christina', 'Williams', 'christina.williams@yahoo.com', 4627990326, 'F', 28, 13, 'Louisiana'),
('Ryan', 'Aguilar', 'ryan.aguilar@yahoo.com', 2154267300, 'F', 54, 8, 'New York'),
('Craig', 'Hamilton', 'craig.hamilton@gmail.com', 6849554027, 'M', 11, 7, 'Maine'),
('Jerry', 'Black', 'jerry.black@gmail.com', 6005357350, 'F', 12, 5, 'North Carolina'),
('Julie', 'Vega', 'julie.vega@hotmail.com', 4035340627, 'F', 43, 12, 'Ohio'),
('James', 'Riddle', 'james.riddle@hotmail.com', 3202872008, 'M', 59, 10, 'Wisconsin'),
('Sarah', 'Austin', 'sarah.austin@gmail.com', 3998880318, 'F', 69, 11, 'Ohio'),
('Bryan', 'Fletcher', 'bryan.fletcher@orkut.com', 7072690690, 'M', 17, 7, 'North Carolina'),
('Peter', 'West', 'peter.west@orkut.com', 2462217238, 'M', 14, 5, 'Ohio'),
('William', 'Moreno', 'william.moreno@hotmail.com', 2188769231, 'M', 66, 14, 'Ohio'),
('Allen', 'Coffey', 'allen.coffey@gmail.com', 7449093809, 'F', 80, 2, 'Pennsylvania'),
('Cheryl', 'Meadows', 'cheryl.meadows@yahoo.com', 2627621871, 'M', 95, 3, 'North Carolina'),
('Michael', 'Ortiz', 'michael.ortiz@gmail.com', 3781314500, 'F', 35, 4, 'Ohio'),
('Adam', 'Campbell', 'adam.campbell@gmail.com', 2975331557, 'M', 53, 3, 'Maine'),
('Christopher', 'Garrett', 'christopher.garrett@yahoo.com', 8838437069, 'M', 71, 13, 'North Carolina'),
('Chloe', 'Barron', 'chloe.barron@orkut.com', 4456541769, 'M', 92, 1, 'North Carolina'),
('Michelle', 'Wilson', 'michelle.wilson@orkut.com', 7037628143, 'M', 9, 5, 'Oregon'),
('Christopher', 'Torres', 'christopher.torres@gmail.com', 8167677889, 'F', 35, 12, 'Texas'),
('William', 'Simmons', 'william.simmons@gmail.com', 8324011076, 'M', 79, 14, 'Pennsylvania'),
('Stephanie', 'Price', 'stephanie.price@gmail.com', 6936563533, 'F', 45, 1, 'North Carolina'),
('Steven', 'Barker', 'steven.barker@yahoo.com', 9142732960, 'F', 51, 10, 'Arkansas'),
('Michaela', 'Gomez', 'michaela.gomez@hotmail.com', 2052953207, 'F', 17, 7, 'Pennsylvania'),
('Tina', 'Watson', 'tina.watson@yahoo.com', 6302928971, 'F', 95, 8, 'Maine'),
('Lawrence', 'Martinez', 'lawrence.martinez@gmail.com', 2659263238, 'M', 37, 11, 'Ohio'),
('Michael', 'Tanner', 'michael.tanner@yahoo.com', 7429557872, 'M', 91, 6, 'New York'),
('Ashley', 'Young', 'ashley.young@yahoo.com', 7172890759, 'M', 50, 14, 'New York'),
('Shane', 'Sullivan', 'shane.sullivan@yahoo.com', 5352502778, 'F', 65, 11, 'North Carolina'),
('Vincent', 'Miller', 'vincent.miller@hotmail.com', 8868597829, 'M', 53, 7, 'New York'),
('Dale', 'Hanson', 'dale.hanson@orkut.com', 8252586748, 'M', 22, 11, 'Kentucky'),
('Jeremy', 'Cook', 'jeremy.cook@gmail.com', 4534679900, 'M', 41, 1, 'New York'),
('Toni', 'Durham', 'toni.durham@gmail.com', 9517504307, 'M', 93, 9, 'Washington'),
('Robert', 'Evans', 'robert.evans@yahoo.com', 4773969320, 'M', 36, 12, 'Maine'),
('Melissa', 'Todd', 'melissa.todd@hotmail.com', 4664131976, 'F', 39, 14, 'New York'),
('Christina', 'Jones', 'christina.jones@yahoo.com', 3315929827, 'M', 70, 14, 'North Carolina'),
('James', 'Peters', 'james.peters@gmail.com', 7724016213, 'M', 13, 14, 'Maine'),
('Steven', 'Cabrera', 'steven.cabrera@yahoo.com', 2847793001, 'M', 23, 5, 'Ohio'),
('Christopher', 'Medina', 'christopher.medina@hotmail.com', 2808750540, 'M', 74, 9, 'North Carolina'),
('Mark', 'Davis', 'mark.davis@yahoo.com', 4484531434, 'F', 21, 5, 'New York'),
('Eric', 'Vasquez', 'eric.vasquez@yahoo.com', 1486157971, 'F', 68, 2, 'New York'),
('Lisa', 'Young', 'lisa.young@hotmail.com', 7422401915, 'M', 14, 2, 'Florida'),
('Brandon', 'Griffin', 'brandon.griffin@orkut.com', 5184119040, 'M', 83, 9, 'Ohio'),
('Ashley', 'White', 'ashley.white@gmail.com', 2455060113, 'F', 79, 8, 'Pennsylvania'),
('Daniel', 'Hernandez', 'daniel.hernandez@orkut.com', 4574834849, 'F', 24, 9, 'Oregon'),
('Diana', 'Jarvis', 'diana.jarvis@gmail.com', 6161371366, 'F', 68, 10, 'Oregon'),
('Jerry', 'Holmes', 'jerry.holmes@orkut.com', 3226461707, 'F', 80, 1, 'North Carolina'),
('Anthony', 'Carr', 'anthony.carr@orkut.com', 3197490812, 'F', 41, 13, 'Maine'),
('Daniel', 'Sanchez', 'daniel.sanchez@yahoo.com', 8596288150, 'F', 95, 7, 'Maine'),
('Sean', 'Lee', 'sean.lee@gmail.com', 6925972889, 'F', 70, 2, 'Maryland'),
('Albert', 'Bishop', 'albert.bishop@yahoo.com', 2818559896, 'M', 14, 6, 'Ohio'),
('David', 'Ho', 'david.ho@orkut.com', 6966550733, 'M', 78, 13, 'Oregon');
-- ********************************************************************************************************************************************************
INSERT INTO Departments (department_name, department_manager) VALUES
('Cardiology', 'Dr. Sophia M�ller'),('Pediatrics', 'Dr. Liam Smith'),('Orthopedics', 'Dr. Olivia Rossi'),('Oncology', 'Dr. James Kov�cs'),('Neurology', 'Dr. Charlotte Chowdhury'),('Gynecology', 'Dr. Amelia Petrov'),
('Pulmonology', 'Dr. Alexander Dubois'),('Endocrinology', 'Dr. Mia Ferreira'),('Urology', 'Dr. Ella Mishra'),('Dermatology', 'Dr. Michael M�ller'),('Rheumatology', 'Dr. Grace Singh'),('Hematology', 'Dr. Zoe Chakraborty'),
('Ophthalmology', 'Dr. Emma Kuhn'),('ENT', 'Dr. William Schneider');
-- ********************************************************************************************************************************************************
INSERT INTO Doctors (doctor_first_name, doctor_last_name, doctor_email, doctor_contact_number, doctor_sex, doctor_qualifications, doctor_department_id) 
VALUES 
('John', 'Doe', 'john.doe@healthy.hospital.in', '1234567890', 'Male', 'DMD', 10),
('Alice', 'Smith', 'alice.smith@healthy.hospital.in', '2345678901', 'Female', 'DDS', 7),
('Michael', 'Johnson', 'michael.johnson@healthy.hospital.in', '3456789012', 'Male', 'MD', 5),
('Emily', 'Brown', 'emily.brown@healthy.hospital.in', '4567890123', 'Female', 'MBBS', 9),
('David', 'Wilson', 'david.wilson@healthy.hospital.in', '5678901234', 'Male', 'MD', 13),
('Jennifer', 'Martinez', 'jennifer.martinez@healthy.hospital.in', '6789012345', 'Female', 'MBBS', 12),
('James', 'Anderson', 'james.anderson@healthy.hospital.in', '7890123456', 'Male', 'PhD Med', 8),
('Jessica', 'Taylor', 'jessica.taylor@healthy.hospital.in', '8901234567', 'Female', 'MBBS', 11),
('Robert', 'Thomas', 'robert.thomas@healthy.hospital.in', '9012345678', 'Male', 'MD', 14),
('Sarah', 'Hernandez', 'sarah.hernandez@healthy.hospital.in', '1234567890', 'Female', 'MBBS', 6),
('William', 'Moore', 'william.moore@healthy.hospital.in', '2345678901', 'Male', 'MD', 4),
('Mary', 'Jackson', 'mary.jackson@healthy.hospital.in', '3456789012', 'Female', 'DDS', 3),
('Daniel', 'Thompson', 'daniel.thompson@healthy.hospital.in', '4567890123', 'Male', 'PhD Med', 2),
('Lauren', 'White', 'lauren.white@healthy.hospital.in', '5678901234', 'Female', 'MBBS', 1),
('Matthew', 'Lee', 'matthew.lee@healthy.hospital.in', '6789012345', 'Male', 'MD', 7),
('Megan', 'Garcia', 'megan.garcia@healthy.hospital.in', '7890123456', 'Female', 'DDS', 5),
('Christopher', 'Rodriguez', 'christopher.rodriguez@healthy.hospital.in', '8901234567', 'Male', 'MD', 9),
('Kimberly', 'Lopez', 'kimberly.lopez@healthy.hospital.in', '9012345678', 'Female', 'DDS', 13),
('Joseph', 'Perez', 'joseph.perez@healthy.hospital.in', '1234567890', 'Male', 'MD', 12),
('Ashley', 'Williams', 'ashley.williams@healthy.hospital.in', '2345678901', 'Female', 'DDS', 8),
('David', 'Hernandez', 'david.hernandez@healthy.hospital.in', '3456789012', 'Male', 'MD', 11),
('Brittany', 'Scott', 'brittany.scott@healthy.hospital.in', '4567890123', 'Female', 'MBBS', 14),
('Ryan', 'Green', 'ryan.green@healthy.hospital.in', '5678901234', 'Male', 'MD', 6),
('Stephanie', 'Adams', 'stephanie.adams@healthy.hospital.in', '6789012345', 'Female', 'MBBS',  4),
('John', 'Nguyen', 'john.nguyen@healthy.hospital.in', '7890123456', 'Male', 'MD', 3),
('Amanda', 'Chavez', 'amanda.chavez@healthy.hospital.in', '8901234567', 'Female', 'MBBS', 2),
('Michael', 'Chang', 'michael.chang@healthy.hospital.in', '9012345678', 'Male', 'MD', 1),
('Samantha', 'Patel', 'samantha.patel@healthy.hospital.in', '1234567890', 'Female', 'MBBS', 7),
('Joshua', 'Kim', 'joshua.kim@healthy.hospital.in', '2345678901', 'Male', 'MD', 5),
('Lauren', 'Nguyen', 'lauren.nguyen@healthy.hospital.in', '3456789012', 'Female', 'MBBS', 9),
('Andrew', 'Patel', 'andrew.patel@healthy.hospital.in', '4567890123', 'Male', 'MD', 13),
('Ashley', 'Kim', 'ashley.kim@healthy.hospital.in', '5678901234', 'Female', 'MBBS', 12),
('Nicholas', 'Gonzalez', 'nicholas.gonzalez@healthy.hospital.in', '6789012345', 'Male', 'MD', 8),
('Madison', 'Wang', 'madison.wang@healthy.hospital.in', '7890123456', 'Female', 'MBBS', 11),
('Kevin', 'Lee', 'kevin.lee@healthy.hospital.in', '8901234567', 'Male', 'MD', 14),
('Olivia', 'Patel', 'olivia.patel@healthy.hospital.in', '9012345678', 'Female', 'DDS', 6),
('Alexander', 'Wong', 'alexander.wong@healthy.hospital.in', '1234567890', 'Male', 'DDS', 4),
('Ella', 'Kim', 'ella.kim@healthy.hospital.in', '2345678901', 'Female', 'MBBS', 3),
('Jacob', 'Patel', 'jacob.patel@healthy.hospital.in', '3456789012', 'Male', 'DMD', 2),
('Hannah', 'Nguyen', 'hannah.nguyen@healthy.hospital.in', '4567890123', 'Female', 'MBBS', 1),
('William', 'Hernandez', 'william.hernandez@healthy.hospital.in', '5678901234', 'Male', 'DMD', 7),
('Grace', 'Garcia', 'grace.garcia@healthy.hospital.in', '6789012345', 'Female', 'MBBS', 5);
-- ********************************************************************************************************************************************************
INSERT INTO Appointments (appointment_date, appointment_patient_id, appointment_doctor_id) VALUES 
('2024-02-12', 175, 29),('2024-02-25', 276, 5),('2024-02-07', 42, 20),('2024-03-08', 121, 36),('2024-03-25', 295, 37),('2024-02-28', 56, 10),('2024-02-10', 102, 14),('2024-03-18', 194, 18),('2024-02-24', 299, 2),
('2024-02-16', 130, 34),('2024-02-29', 54, 11),('2024-03-06', 96, 25),('2024-02-08', 15, 22),('2024-03-12', 243, 28),('2024-03-14', 165, 8),('2024-02-01', 321, 15),('2024-02-25', 309, 17),('2024-03-02', 107, 9),('2024-02-27', 246, 26),
('2024-03-13', 198, 21),('2024-02-20', 286, 1),('2024-02-21', 51, 38),('2024-03-14', 336, 40),('2024-02-07', 295, 13),('2024-03-24', 66, 3),('2024-02-03', 289, 35),('2024-02-05', 229, 16),('2024-03-06', 183, 4),
('2024-02-04', 148, 39),('2024-02-15', 68, 30),('2024-03-18', 334, 20),('2024-03-09', 176, 32),('2024-02-18', 219, 24),('2024-02-05', 268, 31),('2024-02-12', 42, 8),('2024-03-14', 213, 10),('2024-02-26', 112, 5),('2024-03-29', 86, 39),
('2024-02-25', 196, 16),('2024-03-08', 169, 38),('2024-03-09', 62, 9),('2024-03-22', 294, 27),('2024-03-03', 279, 36),('2024-03-09', 176, 1),('2024-02-21', 86, 13),('2024-03-22', 56, 30),('2024-03-19', 311, 18),('2024-03-19', 293, 35),
('2024-03-29', 19, 24),('2024-02-19', 102, 19),('2024-03-17', 265, 33),('2024-03-22', 47, 2),('2024-02-17', 228, 15),('2024-03-11', 51, 26),('2024-03-04', 161, 28),('2024-02-21', 145, 31),('2024-03-06', 122, 22),('2024-02-15', 69, 40),
('2024-02-16', 308, 3),('2024-02-14', 163, 25),('2024-03-03', 253, 32),('2024-02-08', 43, 14),('2024-03-23', 327, 11),('2024-02-25', 218, 7),('2024-02-19', 81, 6),('2024-02-29', 299, 34),('2024-02-12', 264, 23),('2024-03-17', 307, 27),
('2024-02-29', 214, 10),('2024-02-01', 181, 35),('2024-02-15', 21, 39),('2024-02-26', 306, 9),('2024-03-22', 235, 36),('2024-02-09', 186, 8),('2024-03-02', 248, 17),('2024-03-26', 106, 29),('2024-03-19', 84, 14),
('2024-02-29', 237, 1),('2024-02-18', 168, 5),('2024-02-12', 313, 12),('2024-03-02', 78, 21),('2024-03-17', 335, 16),('2024-03-02', 25, 30),('2024-02-14', 97, 37),('2024-02-09', 287, 23),('2024-03-08', 330, 38),('2024-03-10', 248, 3),
('2024-02-29', 279, 7),('2024-02-16', 102, 27),('2024-02-05', 273, 19),('2024-02-20', 203, 40),('2024-03-18', 299, 11),('2024-03-22', 31, 9),('2024-02-22', 57, 24),('2024-03-11', 127, 33),
('2024-02-20', 74, 39),('2024-03-13', 192, 17),('2024-03-29', 224, 32),('2024-02-17', 179, 17),('2024-03-10', 265, 25),('2024-03-06', 46, 38),('2024-03-18', 204, 3),('2024-02-28', 239, 5),
('2024-02-03', 207, 18),('2024-03-27', 310, 13),('2024-02-25', 97, 23),('2024-03-10', 268, 7),('2024-02-14', 146, 29),('2024-03-26', 123, 24),('2024-03-25', 98, 31),('2024-02-03', 203, 40),('2024-03-18', 142, 12),
('2024-03-13', 11, 39),('2024-03-08', 309, 34),('2024-02-16', 150, 3),('2024-03-01', 108, 32),('2024-03-02', 15, 9),('2024-02-11', 154, 36),('2024-02-06', 270, 1),('2024-03-17', 272, 29),('2024-02-21', 202, 15),('2024-02-05', 47, 5),
('2024-03-27', 110, 26),('2024-03-11', 144, 7),('2024-03-03', 48, 24),('2024-03-17', 73, 40),('2024-02-16', 23, 13),('2024-03-06', 241, 37),('2024-02-14', 19, 8),('2024-03-25', 190, 2),('2024-02-17', 54, 16),('2024-03-16', 99, 35),
('2024-02-12', 254, 21),('2024-02-05', 212, 14),('2024-03-27', 16, 19),('2024-02-17', 179, 29),('2024-02-02', 129, 10),('2024-02-18', 290, 5),('2024-03-04', 18, 27),('2024-03-01', 127, 36),('2024-03-28', 192, 30),('2024-02-12', 143, 37),
('2024-03-15', 318, 16),('2024-03-18', 232, 21),('2024-02-02', 243, 40),('2024-03-08', 311, 13),('2024-02-01', 274, 34),('2024-02-24', 53, 9),('2024-03-11', 188, 5),('2024-03-09', 254, 22),('2024-03-19', 26, 2),('2024-03-08', 73, 39),
('2024-02-10', 122, 35),('2024-02-11', 180, 28),('2024-02-08', 319, 1),('2024-03-13', 107, 7),('2024-02-26', 224, 33),('2024-02-07', 183, 14),('2024-03-19', 320, 39),('2024-02-27', 255, 37),('2024-02-17', 145, 26),('2024-03-13', 36, 23),
('2024-02-27', 105, 16),('2024-03-23', 321, 11),('2024-02-25', 26, 1),('2024-02-14', 171, 25),('2024-03-21', 226, 32),('2024-03-03', 69, 9),('2024-03-16', 324, 24),('2024-02-20', 53, 35),('2024-03-24', 163, 13),('2024-02-11', 291, 2),
('2024-02-29', 220, 17),('2024-03-22', 95, 7),
('2024-03-05', 127, 36),('2024-03-18', 276, 27),('2024-02-02', 60, 16),('2024-02-15', 267, 23),('2024-03-11', 91, 40),('2024-02-07', 49, 14),('2024-02-28', 142, 25),('2024-03-21', 177, 32),('2024-02-02', 196, 1),('2024-02-19', 192, 10),
('2024-03-19', 76, 5),('2024-02-15', 290, 18),('2024-02-23', 262, 30),('2024-02-08', 192, 39),('2024-03-03', 252, 4),('2024-02-14', 273, 19),('2024-02-06', 112, 33),('2024-03-08', 144, 8),('2024-03-22', 281, 38),
('2024-03-12', 97, 3),('2024-02-05', 276, 21),('2024-03-29', 79, 24),('2024-02-26', 140, 31),('2024-03-03', 196, 10),('2024-03-10', 330, 3),('2024-03-02', 195, 36),('2024-02-13', 141, 39),('2024-02-22', 292, 26),
('2024-03-29', 62, 21),('2024-02-24', 227, 40),('2024-03-15', 130, 13),('2024-02-06', 311, 9),('2024-03-22', 171, 38),('2024-02-14', 133, 3),('2024-03-08', 268, 16),('2024-02-05', 24, 27),('2024-03-24', 300, 20),
('2024-03-20', 272, 33),('2024-02-01', 308, 6),('2024-03-12', 151, 31),('2024-03-04', 305, 5),('2024-02-08', 267, 24),('2024-02-18', 236, 17);
-- ********************************************************************************************************************************************************
INSERT INTO Insurances (insurance_company_name, insurance_coverage, insurance_premium, insurance_payment_frequency) VALUES
('BlueCross BlueShield', 'Full Body Medical', 2700, 'Monthly'),
('Aetna', 'Dental and Vision', 1520, 'Monthly'),
('Cigna', 'Full Body Medical', 2960, 'Quarterly'),
('UnitedHealthcare', 'Pediatric Care', 1770, 'Quarterly'),
('Humana', 'Full Body Medical', 2800, 'Quarterly'),
('Anthem', 'Mental Health', 2990, 'Annualy'),
('Kaiser Permanente', 'Full Body Medical', 2250, 'Annualy'),
('Molina Healthcare', 'Maternity Care', 2460, 'Annualy'),
('Health Care Service Corporation', 'Full Body Medical', 3010, 'Annualy'),
('Centene Corporation', 'Chronic Disease Management', 3110, 'Quarterly'),
('WellCare', 'Full Body Medical', 2600, 'Annualy'),
('Highmark', 'Prescription Drug Coverage', 1620, 'Annualy'),
('Independence Blue Cross', 'Full Body Medical', 2880, 'Annualy'),
('MVP Health Care', 'Rehabilitation Services', 1960, 'Quarterly'),
('Regence Group', 'Full Body Medical', 2990, 'Annualy'),
('CareFirst', 'Emergency Services', 2000, 'Annualy'),
('Scott and White Health Plan', 'Full Body Medical', 2000, 'Quarterly'),
('Priority Health', 'Surgical Procedures', 3290, 'Monthly'),
('Oscar Health', 'Full Body Medical', 2900, 'Annualy'),
('HealthPartners', 'Preventive Care', 1780, 'Monthly');
-- ********************************************************************************************************************************************************
INSERT INTO Patients_Insurances(patient_id, insurance_id) VALUES
(1, 9), (2, 3), (3, 7), (4, 13), (5, 3), (6, 8), (7, 13), (8, 3), (9, 13), (10, 3),(11, 10), (12, 3), (13, 12), (14, 17), (15, 3), (16, 1), (17, 9), (18, 1), (19, 3), (20, 20),
(21, 9), (22, 19), (23, 3), (24, 14), (25, 5), (26, 12), (27, 7), (28, 16), (29, 10), (30, 1),(31, 4), (32, 18), (33, 2), (34, 11), (35, 20), (36, 9), (37, 13), (38, 13), (39, 15), (40, 17),
(41, 5), (42, 1), (43, 19), (44, 3), (45, 10), (46, 12), (47, 8), (48, 16), (49, 7), (50, 14),(51, 9), (52, 6), (53, 11), (54, 2), (55, 1), (56, 4), (57, 13), (58, 20), (59, 3), (60, 17),
(61, 3), (62, 3), (63, 12), (64, 13), (65, 10), (66, 6), (67, 3), (68, 4), (69, 18), (70, 5),(71, 3), (72, 3), (73, 7), (74, 19), (75, 11), (76, 8), (77, 5), (78, 2), (79, 16), (80, 4),
(81, 10), (82, 14), (83, 1), (84, 17), (85, 6), (86, 18), (87, 9), (88, 1), (89, 13), (90, 8),(91, 19), (92, 3), (93, 14), (94, 5), (95, 12), (96, 7), (97, 16), (98, 10), (99, 1), (100, 4),
(101, 18), (102, 2), (103, 11), (104, 20), (105, 9), (106, 13), (107, 9), (108, 15), (109, 17), (110, 5),(111, 9), (112, 19), (113, 3), (114, 10), (115, 9), (116, 8), (117, 16), (118, 4), (119, 18), (120, 2),
(121, 11), (122, 20), (123, 9), (124, 13), (125, 6), (126, 15), (127, 17), (128, 5), (129, 1), (130, 19),(131, 3), (132, 7), (133, 11), (134, 8), (135, 5), (136, 2), (137, 16), (138, 4), (139, 10), (140, 14),
(141, 12), (142, 3), (143, 6), (144, 18), (145, 9), (146, 1), (147, 13), (148, 3), (149, 8), (150, 19),(151, 3), (152, 14), (153, 5), (154, 9), (155, 7), (156, 16), (157, 10), (158, 1), (159, 3), (160, 18),
(161, 2), (162, 11), (163, 20), (164, 9), (165, 13), (166, 6), (167, 15), (168, 17), (169, 5), (170, 3),(171, 1), (172, 3), (173, 9), (174, 11), (175, 8), (176, 3), (177, 2), (178, 16), (179, 4), (180, 10),
(181, 14), (182, 3), (183, 17), (184, 6), (185, 18), (186, 9), (187, 1), (188, 3), (189, 20), (190, 2),(191, 9), (192, 3), (193, 14), (194, 3), (195, 12), (196, 7), (197, 16), (198, 13), (199, 1), (200, 3),
(201, 18), (202, 2), (203, 11), (204, 3), (205, 9), (206, 9), (207, 6), (208, 15), (209, 17), (210, 5),(211, 3), (212, 19), (213, 3), (214, 7), (215, 11), (216, 8), (217, 5), (218, 2), (219, 16), (220, 4),
(221, 10), (222, 14), (223, 12), (224, 17), (225, 6), (226, 18), (227, 9), (228, 1), (229, 13), (230, 20),(231, 8), (232, 19), (233, 3), (234, 14), (235, 5), (236, 12), (237, 7), (238, 16), (239, 10), (240, 1),
(241, 4), (242, 18), (243, 2), (244, 11), (245, 20), (246, 9), (247, 13), (248, 6), (249, 15), (250, 17),(251, 5), (252, 1), (253, 3), (254, 3), (255, 7), (256, 11), (257, 8), (258, 5), (259, 2), (260, 16),
(261, 2), (262, 10), (263, 14), (264, 12), (265, 17), (266, 6), (267, 18), (268, 9), (269, 1), (270, 13),(271, 20), (272, 8), (273, 3), (274, 3), (275, 14), (276, 5), (277, 1), (278, 7), (279, 16), (280, 10),
(281, 1), (282, 4), (283, 18), (284, 2), (285, 11), (286, 20), (287, 9), (288, 13), (289, 6), (290, 15),(291, 17), (292, 5), (293, 1), (294, 19), (295, 3), (296, 7), (297, 11), (298, 13), (299, 5), (300, 2),
(301, 16), (302, 3), (303, 10), (304, 14), (305, 12), (306, 17), (307, 6), (308, 18), (309, 9), (310, 1),(311, 13), (312, 20), (313, 8), (314, 19), (315, 3), (316, 9), (317, 5), (318, 12), (319, 3), (320, 16),
(321, 10), (322, 1), (323, 4), (324, 18), (325, 9), (326, 11), (327, 3), (328, 9), (329, 13), (330, 6),(331, 15), (332, 17), (333, 9), (334, 1), (335, 19), (336, 3), (337, 13), (338, 11), (339, 8), (340, 5),
(341, 3), (342, 16), (343, 4), (344, 10), (345, 9), (346, 12), (347, 9), (348, 6), (349, 18), (350, 9),(351, 3), (352, 13), (353, 20), (354, 8), (355, 19), (356, 3), (357, 13), (358, 13), (359, 12), (360, 7),
(361, 3), (362, 10), (363, 1), (364, 4), (365, 9), (366, 2), (367, 11), (368, 20), (369, 9), (370, 13),(371, 6), (372, 15), (373, 17), (374, 5), (375, 9), (376, 19), (377, 3), (378, 7), (379, 11), (380, 3),
(381, 5), (382, 2), (383, 1), (384, 4), (385, 13), (386, 9), (387, 9);
-- ********************************************************************************************************************************************************
INSERT INTO Bills (bill_amount, bill_date, bill_insurance_number) 
VALUES 
(350.25, '2024-02-01', 'ABC123456789'),(520.75, '2024-02-02', 'DEF234567890'),(280.50, '2024-02-03', 'GHI345678901'),(430.00, '2024-02-04', 'JKL456789012'),(190.80, '2024-02-05', 'MNO567890123'),(610.30, '2024-02-06', 'PQR678901234'),(410.25, '2024-02-07', 'STU789012345'),(275.90, '2024-02-08', 'VWX890123456'),(140.60, '2024-02-09', 'YZA901234567'),(390.40, '2024-02-10', 'BCD012345678'),
(720.15, '2024-02-11', 'EFG123456789'),(550.20, '2024-02-12', 'HIJ234567890'),(320.75, '2024-02-13', 'KLM345678901'),(430.50, '2024-02-14', 'NOP456789012'),(170.35, '2024-02-15', 'QRS567890123'),(240.90, '2024-02-16', 'TUV678901234'),
(480.10, '2024-02-17', 'WXY789012345'),(330.25, '2024-02-18', 'ZAB901234567'),(510.70, '2024-02-19', 'CDE012345678'),(180.40, '2024-02-20', 'FGH123456789'),(770.25, '2024-02-21', 'IJK234567890'),(690.80, '2024-02-22', 'LMN345678901'),
(310.50, '2024-02-23', 'OPQ456789012'),(260.75, '2024-02-24', 'RST567890123'),(680.90, '2024-02-25', 'TUV678901234'),(570.25, '2024-02-26', 'WXY789012345'),(480.60, '2024-02-27', 'ZAB901234567'),(170.40, '2024-02-28', 'CDE012345678'),
(220.15, '2024-02-29', 'FGH123456789'),(340.80, '2024-03-01', 'IJK234567890'),(580.25, '2024-03-02', 'LMN345678901'),(690.70, '2024-03-03', 'OPQ456789012'),(710.35, '2024-03-04', 'RST567890123'),(440.90, '2024-03-05', 'TUV678901234'),
(260.25, '2024-03-06', 'WXY789012345'),(380.60, '2024-03-07', 'ZAB901234567'),(720.40, '2024-03-08', 'CDE012345678'),(690.25, '2024-03-09', 'FGH123456789'),(210.15, '2024-03-10', 'IJK234567890'),(430.80, '2024-03-11', 'LMN345678901'),
(670.25, '2024-03-12', 'OPQ456789012'),(780.70, '2024-03-13', 'RST567890123'),(790.35, '2024-03-14', 'TUV678901234'),(320.90, '2024-03-15', 'WXY789012345'),(430.25, '2024-03-16', 'ZAB901234567'),(170.60, '2024-03-17', 'CDE012345678'),(280.40, '2024-03-18', 'FGH123456789'),
(570.15, '2024-03-19', 'IJK234567890'),(690.80, '2024-03-20', 'LMN345678901'),(310.50, '2024-03-21', 'OPQ456789012'),(260.75, '2024-03-22', 'RST567890123'),(680.90, '2024-03-23', 'TUV678901234'),(570.25, '2024-03-24', 'WXY789012345'),
(480.60, '2024-03-25', 'ZAB901234567'),(170.40, '2024-03-26', 'CDE012345678'),(220.15, '2024-03-27', 'FGH123456789'),(340.80, '2024-03-28', 'IJK234567890'),(580.25, '2024-03-29', 'LMN345678901'),(690.70, '2024-03-30', 'OPQ456789012'),(710.35, '2024-03-31', 'RST567890123'),
(440.90, '2024-04-01', 'TUV678901234'),(260.25, '2024-04-02', 'WXY789012345'),(380.60, '2024-04-03', 'ZAB901234567'),(720.40, '2024-04-04', 'CDE012345678'),(690.25, '2024-04-05', 'FGH123456789'),(210.15, '2024-04-06', 'IJK234567890'),(430.80, '2024-04-07', 'LMN345678901'),
(670.25, '2024-04-08', 'OPQ456789012'),(780.70, '2024-04-09', 'RST567890123'),(790.35, '2024-04-10', 'TUV678901234'),(320.90, '2024-04-11', 'WXY789012345'),(430.25, '2024-04-12', 'ZAB901234567'),(170.60, '2024-04-13', 'CDE012345678'),
(280.40, '2024-04-14', 'FGH123456789'),(570.15, '2024-04-15', 'IJK234567890'),(690.80, '2024-04-16', 'LMN345678901'),(310.50, '2024-04-17', 'OPQ456789012'),(260.75, '2024-04-18', 'RST567890123'),(680.90, '2024-04-19', 'TUV678901234'),
(570.25, '2024-04-20', 'WXY789012345'),(480.60, '2024-04-21', 'ZAB901234567'),(170.40, '2024-04-22', 'CDE012345678'),(220.15, '2024-04-23', 'FGH123456789'),(340.80, '2024-04-24', 'IJK234567890'),(580.25, '2024-04-25', 'LMN345678901'),
(690.70, '2024-04-26', 'OPQ456789012'),(710.35, '2024-04-27', 'RST567890123'),(440.90, '2024-04-28', 'TUV678901234'),(260.25, '2024-04-29', 'WXY789012345'),(380.60, '2024-04-30', 'ZAB901234567'),(720.40, '2024-05-01', 'CDE012345678'),
(690.25, '2024-05-02', 'FGH123456789'),(210.15, '2024-05-03', 'IJK234567890'),(430.80, '2024-05-04', 'LMN345678901'),(670.25, '2024-05-05', 'OPQ456789012'),(780.70, '2024-05-06', 'RST567890123'),(790.35, '2024-05-07', 'TUV678901234'),(320.90, '2024-05-08', 'WXY789012345'),
(430.25, '2024-05-09', 'ZAB901234567'),(170.60, '2024-05-10', 'CDE012345678'),(266.40, '2024-05-11', 'FGH123456789'),(570.15, '2024-05-12', 'IJK234567890'),(690.80, '2024-05-13', 'LMN345678901'),(310.50, '2024-05-14', 'OPQ456789012'),
(260.75, '2024-05-15', 'RST567890123'),(680.90, '2024-05-16', 'TUV678901234'),(570.25, '2024-05-17', 'WXY789012345'),(480.60, '2024-05-18', 'ZAB901234567'),(170.40, '2024-05-19', 'CDE012345678'),(220.15, '2024-05-20', 'FGH123456789'),
(340.80, '2024-05-21', 'IJK234567890'),(580.25, '2024-05-22', 'LMN345678901'),(690.70, '2024-05-23', 'OPQ456789012'),(710.35, '2024-05-24', 'RST567890123'),(440.90, '2024-05-25', 'TUV678901234'),(260.25, '2024-05-26', 'WXY789012345'),
(380.60, '2024-05-27', 'ZAB901234567'),(720.40, '2024-05-28', 'CDE012345678'),(690.25, '2024-05-29', 'FGH123456789'),(210.15, '2024-05-30', 'IJK234567890'),(430.80, '2024-05-31', 'LMN345678901'),(670.25, '2024-06-01', 'OPQ456789012'),
(780.70, '2024-06-02', 'RST567890123'),(790.35, '2024-06-03', 'TUV678901234'),(320.90, '2024-06-04', 'WXY789012345'),(430.25, '2024-06-05', 'ZAB901234567'),(170.60, '2024-06-06', 'CDE012345678'),(280.40, '2024-06-07', 'FGH123456789'),
(570.15, '2024-06-08', 'IJK234567890'),(690.80, '2024-06-09', 'LMN345678901'),(310.50, '2024-06-10', 'OPQ456789012'),(260.75, '2024-06-11', 'RST567890123'),(680.90, '2024-06-12', 'TUV678901234'),(570.25, '2024-06-13', 'WXY789012345'),
(480.60, '2024-06-14', 'ZAB901234567'),(170.40, '2024-06-15', 'CDE012345678'),(220.15, '2024-06-16', 'FGH123456789'),(340.80, '2024-06-17', 'IJK234567890'),(580.25, '2024-06-18', 'LMN345678901'),(690.70, '2024-06-19', 'OPQ456789012'),
(710.35, '2024-06-20', 'RST567890123'),(440.90, '2024-06-21', 'TUV678901234'),(260.25, '2024-06-22', 'WXY789012345'),(380.60, '2024-06-23', 'ZAB901234567'),(720.40, '2024-06-24', 'CDE012345678'),(690.25, '2024-06-25', 'FGH123456789'),
(210.15, '2024-06-26', 'IJK234567890'),(430.80, '2024-06-27', 'LMN345678901'),(670.25, '2024-06-28', 'OPQ456789012'),(780.70, '2024-06-29', 'RST567890123'),(790.35, '2024-06-30', 'TUV678901234'),(320.90, '2024-07-01', 'WXY789012345'),
(430.25, '2024-07-02', 'ZAB901234567'),(170.60, '2024-07-03', 'CDE012345678'),(280.40, '2024-07-04', 'FGH123456789'),(570.15, '2024-07-05', 'IJK234567890'),(690.80, '2024-07-06', 'LMN345678901'),(310.50, '2024-07-07', 'OPQ456789012'),(260.75, '2024-07-08', 'RST567890123'),
(680.90, '2024-07-09', 'TUV678901234'),(570.25, '2024-07-10', 'WXY789012345'),(480.60, '2024-07-11', 'ZAB901234567'),(170.40, '2024-07-12', 'CDE012345678'),(220.15, '2024-07-13', 'FGH123456789'),(340.80, '2024-07-14', 'IJK234567890'),(580.25, '2024-07-15', 'LMN345678901'),
(690.70, '2024-07-16', 'OPQ456789012'),(710.35, '2024-07-17', 'RST567890123'),(440.90, '2024-07-18', 'TUV678901234'),(260.25, '2024-07-19', 'WXY789012345'),(380.60, '2024-07-20', 'ZAB901234567'),(720.40, '2024-07-21', 'CDE012345678'),(690.25, '2024-07-22', 'FGH123456789'),
(210.15, '2024-07-23', 'IJK234567890'),(430.80, '2024-07-24', 'LMN345678901'),(670.25, '2024-07-25', 'OPQ456789012'),(780.70, '2024-07-26', 'RST567890123'),(790.35, '2024-07-27', 'TUV678901234'),(320.90, '2024-07-28', 'WXY789012345'),(430.25, '2024-07-29', 'ZAB901234567'),
(170.60, '2024-07-30', 'CDE012345678'),(280.40, '2024-07-31', 'FGH123456789'),(570.15, '2024-08-01', 'IJK234567890'),(690.80, '2024-08-02', 'LMN345678901'),(310.50, '2024-08-03', 'OPQ456789012'),(260.75, '2024-08-04', 'RST567890123'),(680.90, '2024-08-05', 'TUV678901234'),
(570.25, '2024-08-06', 'WXY789012345'),(480.60, '2024-08-07', 'ZAB901234567'),(170.40, '2024-08-08', 'CDE012345678'),(220.15, '2024-08-09', 'FGH123456789'),(340.80, '2024-08-10', 'IJK234567890'),(580.25, '2024-08-11', 'LMN345678901'),
(690.70, '2024-08-12', 'OPQ456789012'),(710.35, '2024-08-13', 'RST567890123'),(440.90, '2024-08-14', 'TUV678901234'),(260.25, '2024-08-15', 'WXY789012345'),(380.60, '2024-08-16', 'ZAB901234567'),(720.40, '2024-08-17', 'CDE012345678'),(690.25, '2024-08-18', 'FGH123456789'),
(210.15, '2024-08-19', 'IJK234567890'),(430.80, '2024-08-20', 'LMN345678901'),(670.25, '2024-08-21', 'OPQ456789012'),(780.70, '2024-08-22', 'RST567890123'),(790.35, '2024-08-23', 'TUV678901234'),(320.90, '2024-08-24', 'WXY789012345'),
(430.25, '2024-08-25', 'ZAB901234567'),(170.60, '2024-08-26', 'CDE012345678'),(280.40, '2024-08-27', 'FGH123456789'),(570.15, '2024-08-28', 'IJK234567890'),(690.80, '2024-08-29', 'LMN345678901'),(310.50, '2024-08-30', 'OPQ456789012'),
(260.75, '2024-08-31', 'RST567890123'),(680.90, '2024-09-01', 'TUV678901234'),(570.25, '2024-09-02', 'WXY789012345'),(480.60, '2024-09-03', 'ZAB901234567'),(170.40, '2024-09-04', 'CDE012345678'),(220.15, '2024-09-05', 'FGH123456789'),
(340.80, '2024-09-06', 'IJK234567890'),(580.25, '2024-09-07', 'LMN345678901'),(690.70, '2024-09-08', 'OPQ456789012'),(710.35, '2024-09-09', 'RST567890123'),(440.90, '2024-09-10', 'TUV678901234'),(260.25, '2024-09-11', 'WXY789012345'),
(380.60, '2024-09-12', 'ZAB901234567'),(720.40, '2024-09-13', 'CDE012345678'),(690.25, '2024-09-14', 'FGH123456789'),(210.15, '2024-09-15', 'IJK234567890'),(430.80, '2024-09-16', 'LMN345678901'),(670.25, '2024-09-17', 'OPQ456789012'),
(780.70, '2024-09-18', 'RST567890123'),(790.35, '2024-09-19', 'TUV678901234'),(320.90, '2024-09-20', 'WXY789012345'),(430.25, '2024-09-21', 'ZAB901234567'),(170.60, '2024-09-22', 'CDE012345678'),(280.40, '2024-09-23', 'FGH123456789'),
(570.15, '2024-09-24', 'IJK234567890'),(690.80, '2024-09-25', 'LMN345678901'),(310.50, '2024-09-26', 'OPQ456789012'),(260.75, '2024-09-27', 'RST567890123'),(680.90, '2024-09-28', 'TUV678901234'),(570.25, '2024-09-29', 'WXY789012345'),
(480.60, '2024-09-30', 'ZAB901234567'),(170.40, '2024-10-01', 'CDE012345678'),(220.15, '2024-10-02', 'FGH123456789'),(340.80, '2024-10-03', 'IJK234567890'),(580.25, '2024-10-04', 'LMN345678901'),(690.70, '2024-10-05', 'OPQ456789012'),(710.35, '2024-10-06', 'RST567890123'),(440.90, '2024-10-07', 'TUV678901234'),(260.25, '2024-10-08', 'WXY789012345'),
(380.60, '2024-10-09', 'ZAB901234567'),(720.40, '2024-10-10', 'CDE012345678'),(690.25, '2024-10-11', 'FGH123456789'),(210.15, '2024-10-12', 'IJK234567890'),(430.80, '2024-10-13', 'LMN345678901'),(670.25, '2024-10-14', 'OPQ456789012'),
(780.70, '2024-10-15', 'RST567890123'),(790.35, '2024-10-16', 'TUV678901234'),(320.90, '2024-10-17', 'WXY789012345'),(430.25, '2024-10-18', 'ZAB901234567'),(170.60, '2024-10-19', 'CDE012345678'),(280.40, '2024-10-20', 'FGH123456789'),
(570.15, '2024-10-21', 'IJK234567890'),(690.80, '2024-10-22', 'LMN345678901'),(310.50, '2024-10-23', 'OPQ456789012'),(260.75, '2024-10-24', 'RST567890123'),(680.90, '2024-10-25', 'TUV678901234'),(570.25, '2024-10-26', 'WXY789012345'),
(480.60, '2024-10-27', 'ZAB901234567'),(170.40, '2024-10-28', 'CDE012345678'),(220.15, '2024-10-29', 'FGH123456789'),(340.80, '2024-10-30', 'IJK234567890'),(580.25, '2024-10-31', 'LMN345678901'),(690.70, '2024-11-01', 'OPQ456789012'),(710.35, '2024-11-02', 'RST567890123'),
(440.90, '2024-11-03', 'TUV678901234'),(260.25, '2024-11-04', 'WXY789012345'),(380.60, '2024-11-05', 'ZAB901234567'),(720.40, '2024-11-06', 'CDE012345678'),(690.25, '2024-11-07', 'FGH123456789'),(210.15, '2024-11-08', 'IJK234567890'),(430.80, '2024-11-09', 'LMN345678901'),
(670.25, '2024-11-10', 'OPQ456789012'),(780.70, '2024-11-11', 'RST567890123'),(790.35, '2024-11-12', 'TUV678901234'),(320.90, '2024-11-13', 'WXY789012345'),(430.25, '2024-11-14', 'ZAB901234567'),(170.60, '2024-11-15', 'CDE012345678'),(280.40, '2024-11-16', 'FGH123456789'),
(570.15, '2024-11-17', 'IJK234567890'),(690.80, '2024-11-18', 'LMN345678901'),(310.50, '2024-11-19', 'OPQ456789012'),(260.75, '2024-11-20', 'RST567890123'),(680.90, '2024-11-21', 'TUV678901234'),(570.25, '2024-11-22', 'WXY789012345'),(480.60, '2024-11-23', 'ZAB901234567'),(170.40, '2024-11-24', 'CDE012345678');
-- ********************************************************************************************************************************************************
INSERT INTO Patients_Bills (patient_id, bill_id) VALUES
(168, 1), (257, 2), (45, 3), (312, 4), (173, 5), (291, 6), (124, 7), (389, 8), (205, 9), (60, 10),(3, 11), (366, 12), (287, 13), (86, 14), (149, 15), (329, 16), (197, 17), (14, 18), (52, 19), (276, 20),
(69, 21), (141, 22), (324, 23), (121, 24), (98, 25), (381, 26), (203, 27), (7, 28), (102, 29), (346, 30),(315, 31), (190, 32), (219, 33), (307, 34), (382, 35), (146, 36), (240, 37), (370, 38), (264, 39), (186, 40),
(351, 41), (379, 42), (273, 43), (293, 44), (272, 45), (348, 46), (15, 47), (54, 48), (203, 49), (298, 50),(95, 51), (167, 52), (337, 53), (235, 54), (241, 55), (386, 56), (45, 57), (281, 58), (21, 59), (84, 60),
(377, 61), (198, 62), (313, 63), (158, 64), (65, 65), (236, 66), (43, 67), (357, 68), (189, 69), (277, 70),(49, 71), (144, 72), (279, 73), (205, 74), (109, 75), (267, 76), (31, 77), (281, 78), (328, 79), (360, 80),
(222, 81), (325, 82), (202, 83), (248, 84), (118, 85), (358, 86), (273, 87), (128, 88), (196, 89), (293, 90),(164, 91), (99, 92), (233, 93), (367, 94), (162, 95), (236, 96), (204, 97), (77, 98), (333, 99), (131, 100),
(285, 101), (247, 102), (176, 103), (59, 104), (226, 105), (156, 106), (94, 107), (372, 108), (337, 109), (348, 110),(108, 111), (238, 112), (13, 113), (306, 114), (45, 115), (319, 116), (254, 117), (382, 118), (188, 119), (204, 120),
(81, 121), (22, 122), (275, 123), (263, 124), (113, 125), (284, 126), (303, 127), (60, 128), (319, 129), (110, 130),(343, 131), (98, 132), (305, 133), (181, 134), (217, 135), (386, 136), (280, 137), (94, 138), (175, 139), (365, 140),
(313, 141), (246, 142), (302, 143), (240, 144), (104, 145), (355, 146), (278, 147), (118, 148), (164, 149), (285, 150),(58, 151), (324, 152), (216, 153), (40, 154), (125, 155), (214, 156), (118, 157), (167, 158), (239, 159), (4, 160),
(378, 161), (297, 162), (219, 163), (204, 164), (95, 165), (52, 166), (180, 167), (81, 168), (327, 169), (198, 170),(74, 171), (284, 172), (169, 173), (62, 174), (179, 175), (218, 176), (123, 177), (351, 178), (184, 179), (31, 180),
(108, 181), (364, 182), (261, 183), (137, 184), (39, 185), (323, 186), (200, 187), (71, 188), (133, 189), (298, 190),(27, 191), (387, 192), (247, 193), (148, 194), (346, 195), (276, 196), (194, 197), (88, 198), (302, 199), (164, 200),
(105, 201), (244, 202), (40, 203), (281, 204), (165, 205), (321, 206), (80, 207), (360, 208), (245, 209), (22, 210),(349, 211), (97, 212), (309, 213), (181, 214), (385, 215), (168, 216), (114, 217), (298, 218), (234, 219), (60, 220),
(333, 221), (79, 222), (323, 223), (247, 224), (97, 225), (228, 226), (359, 227), (192, 228), (20, 229), (268, 230),(130, 231), (75, 232), (369, 233), (227, 234), (92, 235), (295, 236), (56, 237), (329, 238), (131, 239), (253, 240),
(108, 241), (350, 242), (221, 243), (86, 244), (322, 245), (189, 246), (58, 247), (365, 248), (187, 249), (340, 250),(243, 251), (88, 252), (285, 253), (152, 254), (299, 255), (57, 256), (372, 257), (236, 258), (78, 259), (346, 260),
(253, 261), (131, 262), (369, 263), (71, 264), (295, 265), (36, 266), (379, 267), (233, 268), (141, 269), (317, 270),(91, 271), (324, 272), (171, 273), (354, 274), (269, 275), (145, 276), (323, 277), (204, 278), (368, 279), (207, 280),
(47, 281), (311, 282), (161, 283), (348, 284), (275, 285), (217, 286), (65, 287), (320, 288), (134, 289), (364, 290),(226, 291), (175, 292), (15, 293), (349, 294), (240, 295), (181, 296), (91, 297), (22, 298);
-- ********************************************************************************************************************************************************
INSERT INTO Allergies (allergy_name) VALUES
('Peanuts'),('Penicillin'),('Shellfish'),('Dust'),('Eggs'),('Milk'),('Soy'),('Wheat'),('Fish'),('Tree nuts'),('Pollen'),('Mold'),('Pet dander'),('Latex'),('Insect stings'),('Sesame'),('Kiwi'),('Sunlight'),
('Grass'),('Cats'),('Dogs'),('Mangoes'),('Alcohol'),('Gluten'),('Lactose'),('Tomatoes'),('Apples'),('Peaches'),('Bananas'),('Shellfish');
-- ********************************************************************************************************************************************************
INSERT INTO Medical_Histories (medical_history_patient_first_name, medical_history_patient_last_name, medical_history_allergy_id)
VALUES
('John', 'Doe', 12),('Jane', 'Smith', 8),('Alice', 'Johnson', 5),('Bob', 'Brown', 17),('Emily', 'Davis', 23),('Michael', 'Wilson', 10),('Sarah', 'Martinez', 29),('Jessica', 'Taylor', 14),('James', 'Hernandez', 27),('Jennifer', 'Lopez', 16),
('Matthew', 'Garcia', 28),('Amanda', 'Martinez', 6),('Christopher', 'Rodriguez', 26),('Ashley', 'Hernandez', 2),('Daniel', 'Lopez', 25),('Sarah', 'Davis', 3),('Ryan', 'Martinez', 15),('Megan', 'Gonzalez', 7),
('Justin', 'Hernandez', 24),('Melissa', 'Martinez', 18),('Kevin', 'Rodriguez', 13),('Stephanie', 'Lopez', 19),('Brandon', 'Perez', 21),('Rachel', 'Hernandez', 30),('Eric', 'Martinez', 1),('Heather', 'Gonzalez', 11),
('Tyler', 'Rodriguez', 22),('Nicole', 'Lopez', 4),('Adam', 'Garcia', 9);
-- ********************************************************************************************************************************************************
insert into patients_medical_histories(patient_id,medical_history_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25), (26, 26), (27, 27), (28, 28), (29, 29), (30, 30)
-- ********************************************************************************************************************************************************
INSERT INTO Emergency_Contacts (emergency_contact_patient_first_name, emergency_contact_patient_last_name, emergency_contact_phone_number, emergency_contact_person_address)
VALUES
('Michael', 'Smith', '0412345678', '123 Sunshine Boulevard, Sunnyville'),('Emily', 'Jones', '0423456789', '45 Oakwood Lane, Forestville'),('David', 'Williams', '0434567890', '789 Riverview Road, Rivertown'),
('Jessica', 'Brown', '0445678901', '21 Meadowlark Drive, Meadowbrook'),('Matthew', 'Wilson', '0456789012', '66 Seabreeze Avenue, Oceanside'),('Sarah', 'Taylor', '0467890123', '34 Maple Grove, Treeton'),('Daniel', 'Anderson', '0478901234', '105 Hilltop Circle, Peaksville'),
('Olivia', 'Thomas', '0489012345', '77 Valleyview Terrace, Valleyview'),('Joshua', 'Moore', '0490123456', '19 Primrose Lane, Flowerfield'),('Ava', 'Jackson', '0491234567', '8 Lakeside Drive, Lakeview'),
('William', 'Martin', '0492345678', '42 Panorama Road, Viewpoint'),('Sophia', 'Thompson', '0493456789', '27 Chestnut Street, Nutgrove'),('Jacob', 'White', '0494567890', '71 Willow Avenue, Willowbrook'),
('Isabella', 'Harris', '0495678901', '15 Pineridge Court, Pinecrest'),('Mason', 'Garcia', '0496789012', '54 Sunnyvale Road, Sunnydale'),('Mia', 'Martinez', '0497890123', '39 Oakridge Boulevard, Oakridge'),('Ethan', 'Robinson', '0498901234', '92 Riverfront Drive, Riverside'),
('Harper', 'Clark', '0499012345', '68 Meadowlane Parkway, Meadowlane'),('Noah', 'Rodriguez', '0400123456', '11 Oceanview Terrace, Seacliff'),('Emma', 'Lewis', '0401234567', '30 Mapleview Avenue, Mapleton'),
('Liam', 'Lee', '0402345678', '83 Hilltop Road, Summitville'),('Avery', 'Walker', '0403456789', '56 Valleyview Drive, Valleyview'),('Oliver', 'Hall', '0404567890', '24 Primrose Circle, Flowerfield'),('Amelia', 'Allen', '0405678901', '17 Lakeside Boulevard, Lakeview'),
('Elijah', 'Young', '0406789012', '61 Panorama Way, Viewpoint'),('Sophia', 'Hernandez', '0407890123', '49 Chestnut Lane, Nutgrove'),('Lucas', 'King', '0408901234', '35 Willow Court, Willowbrook'),
('Aria', 'Wright', '0409012345', '22 Pineridge Drive, Pinecrest'),('Henry', 'Scott', '0410123456', '79 Sunnyvale Lane, Sunnydale'),('Isabella', 'Green', '0411234567', '93 Oakridge Circle, Oakridge'),
('Alexander', 'Davis', '0412345601', '106 Riverfront Way, Riverside'),('Ella', 'Baker', '0423456712', '51 Meadowlane Terrace, Meadowlane'),('Benjamin', 'Miller', '0434567823', '28 Oceanview Avenue, Seacliff'),
('Sofia', 'Wilson', '0445678934', '64 Mapleview Drive, Mapleton'),('James', 'Moore', '0456789045', '97 Hilltop Lane, Summitville'),('Chloe', 'Taylor', '0467890156', '33 Valleyview Circle, Valleyview'),
('William', 'Anderson', '0478901267', '46 Primrose Park, Flowerfield'),('Ava', 'Thomas', '0489012378', '9 Lakeside Terrace, Lakeview'),('Daniel', 'Jackson', '0490123489', '72 Panorama Boulevard, Viewpoint'),
('Grace', 'White', '0491234590', '58 Chestnut Avenue, Nutgrove'),('Michael', 'Harris', '0492345601', '85 Willow Lane, Willowbrook'),('Aubrey', 'Clark', '0493456712', '41 Pineridge Way, Pinecrest'),
('Liam', 'Lewis', '0494567823', '26 Sunnyvale Boulevard, Sunnydale'),('Scarlett', 'Walker', '0495678934', '64 Oakridge Park, Oakridge'),('Noah', 'Hall', '0496789045', '107 Riverfront Terrace, Riverside'),('Olivia', 'Allen', '0497890156', '38 Meadowlane Court, Meadowlane'),
('Jacob', 'Young', '0498901267', '25 Oceanview Circle, Seacliff'),('Emma', 'Hernandez', '0499012378', '71 Mapleview Lane, Mapleton'),('Michael', 'King', '0400123489', '54 Hilltop Drive, Summitville'),('Sophia', 'Baker', '0401234590', '89 Valleyview Road, Valleyview'),
('William', 'Martinez', '0402345601', '13 Primrose Court, Flowerfield'),('Isabella', 'Robinson', '0403456712', '36 Lakeside Parkway, Lakeview'),('Jacob', 'Rodriguez', '0404567823', '63 Panorama Circle, Viewpoint'),('Mia', 'Davis', '0405678934', '47 Chestnut Boulevard, Nutgrove'),
('Benjamin', 'Miller', '0406789045', '29 Willow Park, Willowbrook'),('Avery', 'Wilson', '0407890156', '16 Pineridge Terrace, Pinecrest'),('Ella', 'Moore', '0408901267', '74 Sunnyvale Avenue, Sunnydale'),('Mason', 'Taylor', '0409012378', '51 Oakridge Lane, Oakridge'),
('Aria', 'Anderson', '0410123489', '88 Riverfront Circle, Riverside'),('Lucas', 'Thomas', '0411234590', '32 Meadowlane Boulevard, Meadowlane'),('Lily', 'Jackson', '0412345601', '44 Oceanview Parkway, Seacliff'),('Henry', 'White', '0413456712', '67 Mapleview Court, Mapleton'),
('Evelyn', 'Harris', '0414567823', '23 Hilltop Avenue, Summitville'),('Theodore', 'Clark', '0415678934', '80 Valleyview Lane, Valleyview'),('Hazel', 'Lewis', '0416789045', '39 Primrose Drive, Flowerfield'),('Eli', 'Walker', '0417890156', '12 Lakeside Circle, Lakeview'),
('Penelope', 'Hall', '0418901267', '55 Panorama Boulevard, Viewpoint'),('Levi', 'Allen', '0419012378', '69 Chestnut Parkway, Nutgrove'),('Violet', 'Young', '0420123489', '94 Willow Avenue, Willowbrook'),('Wyatt', 'Hernandez', '0421234590', '37 Pineridge Terrace, Pinecrest');
-- ********************************************************************************************************************************************************
INSERT INTO Patients_Emergency_Contacts(patient_id,emergency_contact_id) VALUES
    (1, 14), (2, 65), (3, 28), (4, 47), (5, 25), (6, 62), (7, 66), (8, 32), (9, 54), (10, 41), (11, 20), (12, 56), (13, 49), (14, 70), (15, 35), (16, 15), (17, 3), 
    (18, 59), (19, 48), (20, 36), (21, 61), (22, 37), (23, 13), (24, 22), (25, 64), (26, 10), (27, 23), (28, 21), (29, 5), (30, 29), (31, 40), (32, 55), (33, 19), 
    (34, 63), (35, 17), (36, 26), (37, 34), (38, 50), (39, 9), (40, 45), (41, 39), (42, 52), (43, 12), (44, 11), (45, 60), (46, 51), (47, 44), (48, 46), (49, 24), 
    (50, 4), (51, 43), (52, 8), (53, 7), (54, 38), 
    (55, 27), (56, 68), (57, 42), (58, 16), (59, 18), (60, 53), (61, 6), (62, 69), (63, 1), (64, 58), (65, 31), (66, 2), (67, 30), (68, 67), (69, 57), (70, 33)


-- ********************************************************************************************************************************************************************************************
-- ********************************************************************************************************************************************************************************************


--External Model Down

DROP TRIGGER if EXISTS t_maximum_appointments_in_a_day
DROP PROCEDURE if EXISTS p_book_apppointment
DROP VIEW if EXISTS v_hospital_patient
DROP VIEW if EXISTS v_hospitals_doctors_appointment
DROP PROCEDURE if EXISTS p_cancel_appointment
DROP VIEW if EXISTS v_hospitals_appointment_monthly

--EXTERNAL model up

GO
-- Since the data is based on date and not time we have considered it to be according to the date and not by time
CREATE TRIGGER t_maximum_appointments_in_a_day
    ON Appointments
    after INSERT,UPDATE as
    BEGIN
    DECLARE @maximum_appointments_per_day INT = 2
        IF EXISTS (
        SELECT appointment_doctor_id, appointment_date
        FROM (
            SELECT appointment_doctor_id, appointment_date, COUNT(*) AS appointment_count
            FROM Appointments
            WHERE appointment_date IN (SELECT appointment_date FROM inserted)
            GROUP BY appointment_doctor_id, appointment_date
        ) AS DoctorAppointments
        WHERE appointment_count > @maximum_appointments_per_day
    )
    BEGIN
        THROW 50002, 't_prevent_max_appointments_per_day: Maximum appointments per day exceeded for a doctor', 1;
    END
END

-- SELECT appointment_doctor_id, appointment_date, COUNT(*) AS appointment_count
-- FROM Appointments
-- GROUP BY appointment_doctor_id, appointment_date
-- ORDER BY appointment_count DESC;
-- *******************************************************************************************************************************************
GO
CREATE PROCEDURE p_book_apppointment
    @appointment_id INT,
    @patient_id INT,
    @doctor_id INT,
    @appointment_date DATE
AS
BEGIN
    -- Check if the doctor exists
    IF NOT EXISTS (SELECT 1 FROM Doctors WHERE doctor_id = @doctor_id)
    BEGIN
        PRINT 'Error: Doctor not found.';
        RETURN;
    END

    -- Check if the patient exists
    IF NOT EXISTS (SELECT 1 FROM Patients WHERE patient_id = @patient_id)
    BEGIN
        PRINT 'Error: Patient not found.';
        RETURN;
    END

    -- Check if the appointment slot is available for the given doctor on the specified date
    DECLARE @appointments_count INT;

    SELECT @appointments_count = COUNT(*)
    FROM Appointments 
    WHERE appointment_doctor_id = @doctor_id 
    AND appointment_date = @appointment_date;

    IF @appointments_count >= 2 -- Assuming maximum 2 appointments per day per doctor
    BEGIN
        PRINT 'Error: Maximum appointments reached for the doctor on the specified date. Try for some other day :)';
        RETURN;
    END

    -- Insert the appointment
    INSERT INTO Appointments (appointment_date, appointment_patient_id, appointment_doctor_id)
    VALUES (@appointment_date, @patient_id, @doctor_id);

    PRINT 'Appointment booked successfully!';
    
END

-- EXEC p_book_apppointment @appointment_id=300, @patient_id = 300, @doctor_id = 42, @appointment_date = '2024-06-14'
-- select * FROM Appointments WHERE appointment_id = 300
-- *******************************************************************************************************************************************
go
create view v_hospital_patient as
	select patient_id, patient_first_name + ' ' + patient_last_name as patient_name
		from Patients
go

-- SELECT * FROM v_hospital_patient
-- *******************************************************************************************************************************************
go
create view v_hospitals_doctors_appointment as
	SELECT d.doctor_id, d.doctor_first_name+' '+d.doctor_last_name as doctor_name, a.appointment_date, COUNT(*) AS appointment_count,
         CASE 
            WHEN COUNT(*) >= 2 THEN 'Unavailable'
            ELSE 'Available'
        END AS availability
    FROM Appointments a JOIN Doctors d on a.appointment_doctor_id = d.doctor_id
    GROUP BY  d.doctor_id,d.doctor_first_name+' '+d.doctor_last_name, a.appointment_date
    
go

-- select * FROM v_hospitals_doctors_appointment ORDER BY appointment_count desc,appointment_date 
-- *******************************************************************************************************************************************
GO
CREATE PROCEDURE p_cancel_appointment
@appointment_id INT
AS
BEGIN
 -- Check if the appointment exists
    IF NOT EXISTS (SELECT 1 FROM Appointments WHERE appointment_id = @appointment_id)
    BEGIN
        PRINT 'Error: Appointment not found.';
        RETURN;
    END

    -- Delete the appointment
    DELETE FROM Appointments WHERE appointment_id = @appointment_id;

    PRINT 'Appointment canceled successfully.';
END

-- EXEC p_cancel_appointment @appointment_id = 300
-- EXEC p_cancel_appointment @appointment_id = 217
-- select COUNT(*) FROM Appointments
-- *******************************************************************************************************************************************
go
create view v_hospitals_appointment_monthly as
	SELECT    
    CASE 
        WHEN MONTH(appointment_date) = 2 THEN 'February'
        WHEN MONTH(appointment_date) = 3 THEN 'March'
    END AS month, p.patient_sex as Gender, COUNT(a.appointment_id) AS total_appointments
    from Appointments a JOIN Patients p on a.appointment_patient_id = p.patient_id
    GROUP BY p.patient_sex, MONTH(appointment_date)
    go
    
-- SELECT * FROM v_hospitals_appointment_monthly
-- *******************************************************************************************************************************************
