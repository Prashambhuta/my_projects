# -*- coding: utf-8 -*-
import scrapy
from ..items import FlipkartScrapperItem


class FlipkartMenTshirtSpider(scrapy.Spider):
    name = 'flipkart_men_tshirt'
    page_number = 2     # initiating page number variable
    iters = 0           # iteration to get page number once
    start_urls = [
        'https://www.flipkart.com/men/tshirts/pr?sid=2oq%2Cs9b'
        '%2Cj9y&otracker=nmenu_sub_Men_0_T-Shirts&page=1']

    def parse(self, response):

        scraped_items = FlipkartScrapperItem()

        # Extracting total number of pages to be scraped, ONCE!!!
        # if iters = 0, get page numner
        if FlipkartMenTshirtSpider.iters == 0:
            page_number_str = \
                response.css('._2zg3yZ span::text').get().split(' ')[3]
            # assign page_number to the nonlocal variable
            FlipkartMenTshirtSpider.page_number = \
                int((page_number_str.replace(',', '')))
            FlipkartMenTshirtSpider.iters += 1

        for listings in response.css('.IIdQZO._1SSAGr'):
            # Extracting brand_name
            brand_name = listings.css('._2B_pmu::text').getall()

            # Extracting product name & product url
            product_name = listings.css('._2mylT6::text').getall()
            product_url_full = listings.css('._2mylT6::attr(href)').getall()
            product_url = [('http://flipkart.com' + s.split('?')[0])
                           for s in product_url_full]

            # Extracting product_id using split & splice
            raw_string = [s.split('?')[1] for s in product_url_full]
            product_id = [s.split('&')[0][4:] for s in raw_string]

            # Extracting listing_id using split & splice
            listing_id = [s.split('&')[1][4:] for s in raw_string]

            # Extracting image url - not possible (Ajax request)
            # thumb_image_url = listings.css('img._3togXc').extract()
            # thumb_image_url = listings.css('img').xpath('@src').getall()

            # Extracting offer price, with removing 'rupee' symbol
            offer_price = listings.css('._1vC4OE::text').extract()
            offer_price = [s.replace('\u20B9', '') for s in offer_price]

            # Extracting original price, with removing 'rupee' symbol
            original_price_raw = listings.css('._3auQ3N::text').getall()
            original_price = [original_price_raw[i] for i in
                              range(1, len(original_price_raw), 2)]

            scraped_items['brand_name'] = brand_name
            scraped_items['product_name'] = product_name
            scraped_items['product_link'] = product_url
            scraped_items['offer_price'] = offer_price
            scraped_items['original_price'] = original_price
            # scraped_items['mainimage_url'] = thumb_image_url
            scraped_items['product_id'] = product_id
            scraped_items['listing_id'] = listing_id

            yield scraped_items

        for i in range(2, 26):
            # Change 26 to FlipkartMenTshirtSpider.page_number for scraping
            # multiple pages
            next_page = FlipkartMenTshirtSpider.start_urls[0][:-1] + str(i)
            yield response.follow(next_page, callback=self.parse)
