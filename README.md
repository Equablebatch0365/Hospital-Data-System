# Hospital Data System

A relational database management system for hospital operations, developed as an academic group project.  This system manages patient records, medical staff, consultations, prescriptions, and hospital resources.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Usage](#usage)
- [Project Information](#project-information)

## 🏥 Overview

The Hospital Data System is a relational database project that demonstrates structured database design for managing hospital operations. The system tracks patient information, doctor assignments, nurse schedules, ward management, medical aid details, payments, consultations, and prescriptions. 

**Note**: This is an educational project created during my first year of study to demonstrate database design and SQL implementation skills.

## ✨ Features

- **Patient Management**: Track patient demographics, contact information, and medical history
- **Doctor Management**: Maintain doctor profiles with specializations and contact details
- **Nurse Scheduling**:  Manage nurse assignments with shift rotations across different wards
- **Ward Management**: Organize hospital wards by type (General, Surgical, Maternity, etc.)
- **Medical Aid Integration**: Track various medical aid schemes and patient coverage
- **Payment Processing**: Record payment transactions with timestamps
- **Consultation Tracking**: Document patient-doctor consultations with reasons and medical records
- **Prescription Management**: Maintain prescription details including dosage, frequency, and side effects

## 🗄️ Database Schema

The system consists of the following interconnected tables:

### Core Entities

1. **Doctor**
   - DoctorID (Primary Key)
   - FirstName, LastName
   - Speciality
   - Contact Information (PhoneNum, Email)
   - Linked to: AppointmentID, PrescriptionID, PatientID

2. **Patient**
   - PatientID (Primary Key)
   - PatientName, Gender, Address
   - Contact Information (PhoneNum, Email)
   - Foreign Keys: DoctorID, MedicalNo, WardNo, PaymentID

3. **Nurse**
   - NurseID (Primary Key)
   - NurseName, Email
   - Foreign Keys: WardNo, ShiftID

4. **Ward**
   - WardNo (Primary Key)
   - WardType (General, Surgical, Maternity, Pediatric, etc.)
   - Foreign Keys: PatientID, NurseID

5. **Shift**
   - ShiftID (Primary Key)
   - ShiftTime (Timestamp)
   - Foreign Keys: WardID, NurseID

6. **MedicalAid**
   - MedicalNo (Primary Key)
   - MedicalAidType (Basic Cover, Comprehensive, Family Cover, etc.)
   - Foreign Key: PatientID

7. **Payment**
   - PaymentID (Primary Key)
   - PaymentDate, PaymentTime
   - Foreign Key: PatientID

8. **Consultation**
   - ConsultationID (Primary Key)
   - ConsultationDate, ConsultationTime
   - Reason, MedRecord
   - Foreign Keys: PatientID, DoctorID

9. **Prescription**
   - PrescripID (Primary Key)
   - PrescripName, Dosage, Frequency, SideEffect
   - Foreign Key: PatientID

### Entity Relationship Diagram

```
Patient ──┬── Doctor
          ├── Ward ── Nurse ── Shift
          ├── MedicalAid
          ├── Payment
          ├── Consultation ── Doctor
          └── Prescription
```

## 🛠️ Technologies Used

- **Database**:  SQL (Oracle Database compatible)
- **Database Modeling Tool**: Oracle Data Modeler (. dmd files)
- **Documentation**: Microsoft Word, PowerPoint
- **Version Control**: Git/GitHub

## 📥 Installation

### Prerequisites
- Oracle Database 11g or higher (or compatible SQL database)
- SQL client (SQL*Plus, SQL Developer, or similar)
- Git

### Clone the Repository
```bash
git clone https://github.com/Equablebatch0365/Hospital-Data-System.git
cd Hospital-Data-System
```

## 🚀 Database Setup

1. **Create the Database Schema**
   ```bash
   sqlplus username/password@database
   @Project/hospitaldatabasesystemdb.sql
   ```

2. **The SQL script will**:
   - Create all necessary tables
   - Set up foreign key relationships
   - Insert sample data for testing

3. **Verify Installation**
   ```sql
   SELECT table_name FROM user_tables;
   ```

## 💡 Usage

### Sample Queries

**View all patients:**
```sql
SELECT * FROM Patient;
```

**Find doctors by specialty:**
```sql
SELECT * FROM Doctor WHERE Speciality = 'Cardiologist';
```

**Get patient consultation history:**
```sql
SELECT c.ConsultationDate, c. Reason, d.FirstName, d.LastName
FROM Consultation c
JOIN Doctor d ON c. DoctorID = d.DoctorID
WHERE c.PatientID = 1;
```

**View nurse shift schedules:**
```sql
SELECT n.NurseName, w.WardType, s.ShiftTime
FROM Nurse n
JOIN Ward w ON n. WardNo = w.WardNo
JOIN Shift s ON n.ShiftID = s.ShiftID;
```

**Check patient prescriptions:**
```sql
SELECT p.PrescripName, p.Dosage, p. Frequency, p.SideEffect
FROM Prescription p
WHERE p.PatientID = 1;
```

## 📁 Project Structure

```
Hospital-Data-System/
├── Project/
│   ├── hospitaldatabasesystemdb.sql    # Main database creation script
│   ├── Project.dmd                      # Data model diagram
│   ├── dl_settings.xml                  # Data modeler settings
│   ├── logical/                         # Logical model files
│   ├── rdbms/                          # RDBMS-specific files
│   └── rel/                            # Relational model files
├── Hospital Data System.pptx            # Project presentation
├── Info systems final documentation.docx # Complete documentation
├── Info systems presentation - hospital data systems.txt # SQL scripts
└── Hospital Management System (3).jpeg  # System diagram
```

## 📊 Ward Types Supported

- General
- Surgical
- Maternity
- Pediatric
- Psychiatric
- Oncology
- Cardiology
- Neurology
- Orthopedic
- Geriatric
- Burn Unit
- Rehabilitation
- Pulmonary
- Digestive
- Dialysis
- Emergency
- Trauma
- Isolation
- Neonatal

## 🩺 Medical Aid Types Available

- Basic Cover
- Comprehensive Cover
- Family Cover
- Student Plan
- Senior Citizen Cover
- Hospital Plan
- Executive Plan
- Chronic Illness Cover
- Maternity Plan
- Emergency Only
- Dental and Optical
- Essential Cover
- Travel Insurance
- Premium Plan
- Specialist Cover
- Standard Cover
- Pensioner Plan
- Corporate Cover
- Individual Plan
- Comprehensive Plus

## 📚 Project Information

**Academic Context**: This project was completed as part of a first-year Information Systems course (Group 17).

**Original Contributors**:
- Mokekoloana Modiba 
- Linda Skhosana
- Vuyelo Hlungwane
- Lesedi Motau
- Jessica Sewape

**Purpose**: Educational demonstration of database design principles, SQL implementation, and relational database management concepts.

**Disclaimer**: This system contains sample data for demonstration and learning purposes only. It is not intended for production use or handling real patient data.

---

**Portfolio Note**: This repository showcases database design and SQL skills acquired during academic studies. 
