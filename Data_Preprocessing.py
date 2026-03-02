from pyspark.sql import functions as F

def scale_1_5(col):
    return (F.col(col).cast("double") - 1.0) / 4.0

# Yelp from curated parquet
yelp = (spark.read.parquet("hdfs:///projects/your_uid/yelp_reviews_parquet")
        .select(F.lit("yelp").alias("source"),
                "review_id",
                F.col("text"),
                "score_0_1",
                F.col("date").alias("review_ts")))

# Kindle from shared or personal HDFS path
kindle_raw = spark.read.option("header", True).csv("hdfs:///data/kindle/preprocessed_kindle_review.csv")
kindle = (kindle_raw
          .select(F.lit("kindle").alias("source"),
                  F.sha2(F.col("reviewText"), 256).alias("review_id"),
                  F.col("reviewText").alias("text"),
                  scale_1_5("rating").alias("score_0_1"),
                  F.lit(None).cast("timestamp").alias("review_ts")))

# IMDB preprocessed and stored as parquet
imdb = (spark.read.parquet("hdfs:///data/imdb/imdb_reviews.parquet")
        .select(F.lit("imdb").alias("source"),
                "id".alias("review_id"),
                "text",
                F.when(F.col("label") == "pos", 1.0).otherwise(0.0).alias("score_0_1"),
                F.lit(None).cast("timestamp").alias("review_ts")))

all_reviews = yelp.unionByName(kindle, allowMissingColumns=True).unionByName(imdb, allowMissingColumns=True)
all_reviews.write.mode("overwrite").parquet("hdfs:///projects/your_uid/all_reviews_parquet")
