# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class FlipkartScrapperItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    # mainimage_url = scrapy.Field()
    brand_name = scrapy.Field()
    product_name = scrapy.Field()
    offer_price = scrapy.Field()
    original_price = scrapy.Field()
    product_link = scrapy.Field()
    product_id = scrapy.Field()
    listing_id = scrapy.Field()

    pass
