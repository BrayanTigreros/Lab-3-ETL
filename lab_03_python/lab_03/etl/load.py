from sqlalchemy import create_engine, text
import pandas as pd
from transform import transform_fact_sales
import os


def save_dimensions_to_csv(target_file, **dataframes):
    
    for name, df in dataframes.items():
        file_path = os.path.join(target_file, f"{name}.csv")
        df.to_csv(file_path, index=False)
        print(f"Saved: {file_path}")


def load_to_dw(dim_product, dim_customer, dim_channel, dim_time, sales_df, debug=False):

    engine = create_engine(
        "mysql+pymysql://root:davidsp@localhost:3306/clothing_store_dw"
    )

    if debug:
        reset_dw(engine)

    dim_time.to_sql("time_dim", engine, if_exists="append", index=False)
    dim_product.to_sql("product_dim", engine, if_exists="append", index=False)
    dim_customer.to_sql("customer_dim", engine, if_exists="append", index=False)
    dim_channel.to_sql("channel_dim", engine, if_exists="append", index=False)

    product_dim_db = pd.read_sql(
        "SELECT product_key, product_id FROM product_dim",
        engine
    )

    customer_dim_db = pd.read_sql(
        "SELECT customer_key, customer_id FROM customer_dim",
        engine
    )

    channel_dim_db = pd.read_sql(
        "SELECT channel_key, channel_id FROM channel_dim",
        engine
    )

    time_dim_db = pd.read_sql(
        "SELECT time_key, day, month, year FROM time_dim",
        engine
    )

    fact_sales = transform_fact_sales(
        sales_df,
        product_dim_db,
        customer_dim_db,
        channel_dim_db,
        time_dim_db
    )

    fact_sales.to_sql("sales_fact", engine, if_exists="append", index=False)

    print("Carga completada exitosamente")

def reset_dw(engine):
    """
    Modo DEBUG:
    Elimina todos los datos del DW respetando el orden de claves foráneas.
    """

    with engine.begin() as conn:
        # Primero fact (tiene FKs)
        conn.execute(text("DELETE FROM sales_fact"))

        # Luego dimensiones
        conn.execute(text("DELETE FROM time_dim"))
        conn.execute(text("DELETE FROM product_dim"))
        conn.execute(text("DELETE FROM customer_dim"))
        conn.execute(text("DELETE FROM channel_dim"))

    print("Data Warehouse limpiado correctamente (modo debug)")