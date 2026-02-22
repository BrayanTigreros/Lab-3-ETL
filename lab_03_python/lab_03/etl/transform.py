import pandas as pd

def transform_product_dim(products_df):

    df = products_df.copy()
    df.columns = df.columns.str.strip().str.lower()

    df = df.drop_duplicates(subset=['product_id'])

    return df[['product_id', 'name', 'category', 'brand']]


def transform_customer_dim(customers_df):

    df = customers_df.copy()
    df.columns = df.columns.str.strip().str.lower()

    df = df.drop_duplicates(subset=['customer_id'])

    return df[['customer_id', 'name', 'city', 'country', 'age']]


def transform_channel_dim(channels_df):

    df = channels_df.copy()
    df.columns = df.columns.str.strip().str.lower()

    df = df.drop_duplicates(subset=['channel_id'])
    df = df.rename(columns={'channel': 'channel_name'})

    return df[['channel_id', 'channel_name']]


def transform_time_dim(sales_df):

    df = sales_df.copy()
    df.columns = df.columns.str.strip().str.lower()

    df['sale_date'] = pd.to_datetime(df['sale_date'])

    dim_time = df[['sale_date']].drop_duplicates().copy()

    dim_time['day'] = dim_time['sale_date'].dt.day.astype(int)
    dim_time['month'] = dim_time['sale_date'].dt.month.astype(int)
    dim_time['year'] = dim_time['sale_date'].dt.year.astype(int)

    return dim_time[['day', 'month', 'year']]

def transform_fact_sales(
        sales_df,
        product_dim_db,
        customer_dim_db,
        channel_dim_db,
        time_dim_db):

    """
    IMPORTANTE:
    Las dimensiones recibidas aquí ya deben venir desde la base de datos,
    es decir, deben contener los surrogate keys generados por MySQL.
    """

    df = sales_df.copy()
    df.columns = df.columns.str.strip().str.lower()

    df['sale_date'] = pd.to_datetime(df['sale_date'])
    df['day'] = df['sale_date'].dt.day.astype(int)
    df['month'] = df['sale_date'].dt.month.astype(int)
    df['year'] = df['sale_date'].dt.year.astype(int)

    df = df.merge(
        product_dim_db[['product_key', 'product_id']],
        on='product_id',
        how='left'
    )

    df = df.merge(
        customer_dim_db[['customer_key', 'customer_id']],
        on='customer_id',
        how='left'
    )

    df = df.merge(
        channel_dim_db[['channel_key', 'channel_id']],
        on='channel_id',
        how='left'
    )

    df = df.merge(
        time_dim_db[['time_key', 'day', 'month', 'year']],
        on=['day', 'month', 'year'],
        how='left'
    )

    fact = df[[
        'quantity',
        'unit_price_sale',
        'product_key',
        'customer_key',
        'channel_key',
        'time_key'
    ]].rename(columns={
        'product_key': 'product_dim_product_key',
        'customer_key': 'customer_dim_customer_key',
        'channel_key': 'channel_dim_channel_key',
        'time_key': 'time_dim_time_key'
    })

    return fact
    