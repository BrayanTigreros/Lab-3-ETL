import pandas as pd

# Transform sales data
def transform_sales_data(df_sales):

    # Convertir a datetime
    df_sales["sale_date"] = pd.to_datetime(df_sales["sale_date"], errors="coerce")
    return df_sales

