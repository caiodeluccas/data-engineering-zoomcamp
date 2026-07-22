import pandas as pd
from sqlalchemy import create_engine


def ingest_green_taxi(engine):
    chunk_size = 100000
    first = True

    df = pd.read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet')
    
    for start in range(0, len(df), chunk_size):
        chunk = df.iloc[start:start + chunk_size]

        if first:
            chunk.head(0).to_sql(
                name="green_taxi_data",
                con=engine,
                if_exists = "replace",
                index=False
            )
            first = False
            print("Table Created")

        chunk.to_sql(
            name="green_taxi_data",
            con=engine,
            if_exists="append",
            index=False
        )

        print("Inserted:", len(chunk))



def ingest_taxi_zones(engine):

    #Not using iterator because the table has less than 300 lines
    df = pd.read_csv('https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv')

    df.to_sql(
        name='taxi_zone_data',
        con=engine,
        if_exists='replace',
        index=False
    )


def main():
    engine = create_engine(
        "postgresql+psycopg://root:root@localhost:5432/ny_taxi_green"
    )

    ingest_green_taxi(engine)
    ingest_taxi_zones(engine)

if __name__ == "__main__":
    main()