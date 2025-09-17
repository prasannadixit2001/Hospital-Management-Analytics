📌 **Problem Statement**

Hospitals generate massive volumes of data across patients, appointments, billing, insurance, and diseases. However, this data often remains siloed, making it difficult to integrate and extract insights for decision-making.

💡 **Solution**

We designed and implemented a complete Hospital Management System that integrates clinical and operational data into a structured SQL database, enforced with real-world rules, and visualized through interactive Power BI dashboards.

**End-to-End Flow**:
Conceptual ERD → Logical ERD → SQL Schema (with constraints, triggers, procedures, views) → Power BI dashboards

**🛠️ Tech Stack**

Database: Azure Data Studio (SQL Server)

Visualization: Microsoft Power BI

🚀 **Features**

✅ Conceptual & Logical ERDs to map hospital entities and relationships

✅ SQL Schema (1000+ lines) with up/down scripts & integrity constraints

✅ **Business Logic**:

Triggers (e.g., prevent doctors from exceeding daily appointment limits);
Stored Procedures (e.g., booking/canceling appointments with validations);
Views for simplified reporting.

✅ **Power BI Dashboards covering**:

Appointments Analysis (gender, age, date trends);
Insurance Coverage & Revenue (588K revenue captured);
Department Overview (42 doctors, 15+ specialties);
Billing Insights (monthly & daily trends);
Patient & Disease Mapping across US states;
(Note: Power BI .pbix files are not included due to restrictions. Screenshots have been added to demonstrate key insights).

⚡ **How to Run**

Clone this repository
Open Azure Data Studio → Import the SQL file from /Database/DBMS_projectFinalisedCode.sql;
Run the schema creation + inserts;
Use the Power BI SQL Server connector to connect your database;
Load dashboards from /Dashboards folder (screenshots only if PBIX files are not available).
