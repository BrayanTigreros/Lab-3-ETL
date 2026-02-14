import pandas as pd

# Extract data from channels data csv
def extract_channels_data(path):
    df_channels = pd.read_csv(path)
    return df_channels

# Extract data from customers data csv
def extract_customers_data(path):
    df_customers = pd.read_csv(path)
    return df_customers

# Extract data from products data csv
def extract_products_data(path):
    df_products = pd.read_csv(path)
    return df_products

# Extract data from sales data csv
def extract_sales_data(path):
    df_sales = pd.read_csv(path, sep=';')
    return df_sales

