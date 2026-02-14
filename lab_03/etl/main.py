import pandas as pd
from log import log_progress
from extract import extract_channels_data, extract_customers_data, extract_products_data, extract_sales_data
from transform import transform_sales_data

# Define log file path
log_file = r'C:\Users\btigr\Documents\UAO\5\ETL\ETL_2026_1\lab_03\lab_03\logs\log_file.txt'

# Define data path
data_path = r'C:\Users\btigr\Documents\UAO\5\ETL\ETL_2026_1\lab_03\lab_03\data\raw'

def main():

    # Start ETL process
    log_progress("Starting ETL process", log_file)

    # Extract data from channels data csv
    log_progress("Extract phase started", log_file)

    df_channels = extract_channels_data(data_path + r'\synthetic_channels_data_clothing.csv')
    df_customers = extract_customers_data(data_path + r'\synthetic_customers_data_clothing.csv')
    df_products = extract_products_data(data_path + r'\synthetic_products_data_clothing.csv')
    df_sales = extract_sales_data(data_path + r'\synthetic_sales_data_clothing.csv')

    print(df_sales.dtypes)
    print(df_sales.head())

    log_progress("Extracted phase complete", log_file)

    # Transform sales data
    log_progress("Transform phase started", log_file)
    df_sales_transformed = transform_sales_data(df_sales)
    log_progress("Transform phase complete", log_file)


    # confirmar que la columna date_sale es de tipo datetime
    print(df_sales_transformed.dtypes)

    print(df_sales_transformed.head())






if __name__ == "__main__":  
    main()