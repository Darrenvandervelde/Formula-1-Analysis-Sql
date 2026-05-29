# Formula 1 Project - Data Analysis

### [Preview Questions](https://github.com/Darrenvandervelde/Formula-1-Project-Data-Analysis-/blob/main/Docs/1.Formula_1_Data_Analysis__Capstone_Project_Questions.pdf)
### [Preview Answers](https://github.com/Darrenvandervelde/Formula-1-Project-Data-Analysis-/blob/main/SQL)


## Overview

This project provides a **comprehensive analysis of Formula 1 race data** using SQL queries. The dataset contains information about:

- **Races**: Grand Prix, year, round, location  
- **Drivers**: Personal information and race participation  
- **Constructors**: Teams and their historical performance  
- **Results**: Race outcomes, points, and positions  
- **Circuits**: Race tracks and locations  
- **Lap Times**: Performance metrics per driver per race  

The goal is to analyze patterns such as:

- Decades with the most races  
- Top drivers and constructors  
- High-altitude circuits  
- Average points per race  
- Lap time analysis of winning drivers  

---

## Prerequisites

Before running the project, you need:

1. **MySQL Server**  
   - Version 8.x recommended  
   - [Download MySQL Community Server](https://dev.mysql.com/downloads/mysql/)  

2. **MySQL Workbench**  
   - GUI tool to manage your MySQL databases and execute queries  
   - [Download MySQL Workbench](https://dev.mysql.com/downloads/workbench/)  

3. **SQL Dataset**  
   - Import the provided `.sql` dataset into your MySQL server.  

---

## Installation

### Step 1: Install MySQL Server

1. Download the installer from [MySQL Downloads](https://dev.mysql.com/downloads/mysql/).  
2. Run the installer and follow the setup wizard.  
3. Set a root password and remember it (you’ll need it to connect via Workbench).  
4. Complete the installation and start the MySQL server.  

### Step 2: Install MySQL Workbench

1. Download MySQL Workbench from [MySQL Workbench Downloads](https://dev.mysql.com/downloads/workbench/).  
2. Run the installer and follow the installation instructions.  
3. Open MySQL Workbench and **create a new connection**:  
   - Host: `localhost`  
   - Port: `3306`  
   - Username: `root`  
   - Password: (your root password)  
4. Test the connection to ensure it works.  

### Step 3: Import the Database

1. Open MySQL Workbench and connect to your MySQL server.  
2. Go to **Server > Data Import**.  
3. Select **Import from Self-Contained File** and choose your `.sql` dataset.  
4. Choose **New Schema** (e.g., `f1_analysis`) or select an existing one.  
5. Click **Start Import**.  

---

## Usage

Once the database is imported:

1. Open a new SQL query tab in MySQL Workbench.  
2. Select your database/schema:  
   ```sql
   USE f1_analysis;
