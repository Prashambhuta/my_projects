# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html

import pymongo
from scrapy.exceptions import DropItem              # to remove duplicates
from .settings import MONGO_URI, MONGO_DATABASE     # import connection params


class FlipkartScrapperPipeline:

    def __init__(self):
        # # LOCAL CONNECTION
        # # Creating a local connection variable
        # self.connection = pymongo.MongoClient('localhost', 27017)
        #
        # # Creating a local database, and assigning to a variable 'db'
        # db = self.connection['flipkart']
        #
        # # Creating a local collection(table, schema)
        # self.collection = db['men_tshirt']

        # REMOTE CONNECTION
        # Creating remote connection variable
        self.connection = pymongo.MongoClient(MONGO_URI)

        # Creating a remote database, and assigning to a variable 'db'
        db = self.connection[MONGO_DATABASE]

        # Creating a remote collection(table, schema)
        self.collection = db['men_tshirt']

        # Creating set of inputs
        self.ids_seen = set()

    def process_item(self, item, spider):
        # Removing duplicates, filter by 'product_id'
        if 'product_id' in self.ids_seen:
            raise DropItem("Duplicate item found: %s" % item)
        else:
            self.collection.update({'product_id': item['product_id']},
                                   dict(item), upsert=True)
        return item
