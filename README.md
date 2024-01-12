# Multinational Retail Data Centralisation

This project, part of the data science career accelerator at Ai Core, focuses on data extraction and cleaning from various sources in Python, followed by uploading the data to a PostgreSQL database. The database schema is designed using the star schema, enabling data-driven insights through PostgreSQL queries.

## Scenario

You work for a multinational company selling goods globally. The sales data is scattered across multiple sources, making it challenging to access and analyze. The goal is to centralize sales data into a PostgreSQL database, acting as a single source of truth. Subsequently, the data is queried to provide valuable insights for business decisions.

## Key Technologies

- PostgreSQL
- AWS (S3)
- boto3
- REST-API
- CSV
- Python (Pandas)

## Project Structure

### Project Utils

1. **Data Extraction:** Methods in `data_extraction.py` handle data upload into Pandas DataFrames from different sources.
2. **Data Cleaning:** `data_cleaning.py` includes the `DataCleaning` class, cleaning tables uploaded in `data_extraction.py`.
3. **Database Connection:** `database_utils.py` defines the `DatabaseConnector` class, initializing the database engine from credentials in a `.yml` file.
4. **Main Script:** `main.py` contains methods for direct data upload into the local database.

### Step by Step Data Processing

1. **Data Sources:**
   - Remote Postgres databases in AWS Cloud
   - Public link in AWS Cloud (S3) for PDF data
   - AWS S3 bucket for product data
   - RESTful API for store and date details

2. **Milestones:**
   - **Milestone 1:** Set up the environment
   - **Milestone 2:** Extract and clean the data from various sources
   - **Milestone 3:** Create the database schema
   - **Milestone 4:** Query the data

### Usage Instructions

1. Clone the repository.
2. Set up the environment following the instructions in Milestone 1.
3. Execute scripts in Milestone 2 to extract and clean data.
4. Proceed with Milestone 3 to create the database schema.
5. Utilize Milestone 4 for querying data and extracting business insights.

### Installation

- Install required packages using `pip install -r requirements.txt`.
- Configure database credentials in `.yml` files.

### License

This project is licensed under the [MIT License](LICENSE).

For detailed step-by-step instructions and tasks, refer to the provided documentation in the project milestones.

Feel free to explore, contribute, and enhance the project!
