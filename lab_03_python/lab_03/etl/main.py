import pandas as pd
from log import log_progress
from extract import extract_channels_data,extract_customers_data,extract_products_data,extract_sales_data
from transform import transform_product_dim,transform_customer_dim,transform_channel_dim,transform_time_dim
from load import load_to_dw, save_dimensions_to_csv

log_file = r'C:\Users\btigr\Documents\UAO\5\ETL\ETL_2026_1\lab_03\ddm_lab\lab_03\logs\log_file.txt'

target_file = r'C:\Users\btigr\Documents\UAO\5\ETL\ETL_2026_1\lab_03\ddm_lab\lab_03\data\warehouse'

data_path = r'C:\Users\btigr\Documents\UAO\5\ETL\ETL_2026_1\lab_03\ddm_lab\lab_03\data\raw'


def main():

    log_progress("Starting ETL process", log_file)
    log_progress("Extract phase started", log_file)

    df_channels = extract_channels_data(data_path + r'\synthetic_channels_data_clothing.csv')
    df_customers = extract_customers_data(data_path + r'\synthetic_customers_data_clothing.csv')
    df_products = extract_products_data(data_path + r'\synthetic_products_data_clothing.csv')
    df_sales = extract_sales_data(data_path + r'\synthetic_sales_data_clothing.csv')

    print("Channels Data:\n", df_channels.head())
    print("\nCustomers Data:\n", df_customers.head())
    print("\nProducts Data:\n", df_products.head())
    print("\nSales Data:\n", df_sales.head())

    log_progress("Extract phase complete", log_file)
    log_progress("Transform phase started", log_file)

    dim_product = transform_product_dim(df_products)
    dim_customer = transform_customer_dim(df_customers)
    dim_channel = transform_channel_dim(df_channels)
    dim_time = transform_time_dim(df_sales)

    print("\n\nProduct Dimension:\n", dim_product.head())
    print("\nCustomer Dimension:\n", dim_customer.head())
    print("\nChannel Dimension:\n", dim_channel.head())
    print("\nTime Dimension:\n", dim_time.head())

    log_progress("Transform phase complete", log_file)
    log_progress("Load phase started", log_file)

    save_dimensions_to_csv(
        target_file,
        dim_product=dim_product,
        dim_customer=dim_customer,
        dim_channel=dim_channel,
        dim_time=dim_time,
        fact_sales=df_sales
    )

    load_to_dw(
        dim_product,
        dim_customer,
        dim_channel,
        dim_time,
        df_sales,
        debug=True
    )

    log_progress("Load phase complete", log_file)


if __name__ == "__main__":
    main()

