-- Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Speciality VARCHAR(150),
    PhoneNum VARCHAR(10),
    Email VARCHAR(255)
);


-- Patient table
CREATE TABLE Patient (
    PatientID INT NOT NULL,
    PatientName VARCHAR(15),
    Gender VARCHAR(10),
    Address VARCHAR(30),
    PhoneNum VARCHAR(15),
    Email VARCHAR(255),
    PRIMARY KEY(PatientID),
    DoctorID INT,
    MedicalNo INT,
    WardNo INT,
    PaymentID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (MedicalNo) REFERENCES MedicalAid(MedicalNo),
    FOREIGN KEY (WardNo) REFERENCES Ward(WardNo),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
);

-- Ward table
CREATE TABLE Ward (
    WardNo INT PRIMARY KEY,
    WardType VARCHAR(10)
);

-- Nurse table
CREATE TABLE Nurse (
    NurseID INT PRIMARY KEY,
    NurseName VARCHAR(100),
    Email VARCHAR(80),
    WardNo INT,
    ShiftID INT,
    FOREIGN KEY (WardNo) REFERENCES Ward(WardNo),
    FOREIGN KEY (ShiftID) REFERENCES Shift(ShiftID)
);

-- Shift table
CREATE TABLE Shift (
    ShiftID INT PRIMARY KEY,
    ShiftTime TIMESTAMP
);

-- Medical Aid table
CREATE TABLE MedicalAid (
    MedicalNo INT PRIMARY KEY,
    MedicalAidType VARCHAR(150)
);

-- Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    PaymentDate DATE,
    PaymentTime TIMESTAMP
);

-- Consultation table
CREATE TABLE Consultation (
    ConsultationID INT PRIMARY KEY,
    ConsultationDate DATE,
    ConsultationTime TIMESTAMP,
    Reason VARCHAR(100),
    MedRecord VARCHAR(150),
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Prescription table
CREATE TABLE Prescription_Details (
    PrescripID INT PRIMARY KEY,
    PrescripName VARCHAR(100),
    Dosage VARCHAR(100),
    Frequency VARCHAR(150),
    SideEffect VARCHAR(300),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO patient(patientid,patientname,gender,address,phonenum,email)VALUES(101,'Jane','Female','6 Jan Viljoen Str','0713428732','jane@gmail.com);
INSERT INTO patient(patientid,patientname,gender,address,phonenum,email)VALUES(102,'Randy','Male','8 Jan Viljoen Str','0713428733','ran@gmail.com);