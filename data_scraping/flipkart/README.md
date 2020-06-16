# Scraping Flipkart section of men's t-shirt

## Intro
* A web scraper that scrapes data from a particular section of Flipkart, saves it in .csv format and loads the data to a remote MongoDB collection.

## Details
* The website to be scraped is flipkart.com, Men’s t-shirt section, direct link to the page is:
https://www.flipkart.com/men/tshirts/pr?sid=2oq%2Cs9b%2Cj9y&otracker=nmenu_sub_Men_0_T-Shirts&page=1


## Project structure

* assignment-2
    * /dump - contains all the response.html, resposne.json, trial_outputs
        * [output](dump/output) - contains the output, [men_tshirt.csv](dump/output/men_tshirt.csv)
    * [/flipkart_scrapper/flipkart_scrapper](/flipkart_scrapper/flipkart_scrapper) - scrapy project to scrap the website.
    Follows regular scrapy project structure.
        * spiders - contains crawlers
            * flipkart_men_tshirt.py - main crawler.
    * /images - contains images used in documentation.
    * /issues - roadblocks experienced while scraping certain elements of Flipkart.
        * [scraping_multiple_pages](issues/scraping_multiple_pages.md) - issue with scraping contents after page no 25.
        * [scraping_image_links](issues/scraping_image_links.md)
    * requirements.txt - libraries required. Use `pip install -r requirements.txt` to install.

## Solution

* You can connect to the database using the following URI:
    ```py
    'mongodb+srv://new_user:mongoDB123@greendeck-1-hnozk.mongodb.net/greendeck-1?retryWrites=true&w=majority'
    ```
* Check out the project demo, [here.](demo.mp4) **FAST FORWARD IT**

### Approach
Following steps underline the approach to the solution.

* Understanding the assignment, reading scrapy documentation + tutorial.
* Scraping the first page- getting the proper css selectors, defining items.
* Cleaning data in proper format, such as parsing out product_ids & listing_ids.
* Scraping multiple pages, getting the page number and running a for loop.
* Setting up a local MongoDB db, and exporting the scraped items to it.
* Filtering the scraped items, for duplicates.
* Setting up a remote MongoDB connection and exporting the items to it.

### Application
* `/items.py` - defining fields that are a simple container of class `Item`.
* `/spiders/flipkart_men_tshirt.py` - collecting data using css selector and storing that data as a type of `Field`.
* `/pipelines.py` - receives the items, processes/filters it and returns the items.
* `/settings.py` - helps defining project variables such as `MONGO_URI, MONGO_DATBASE, FEED_URI...`

### Breakdown
* The breakdown of the task can be seen below, with majority of time taken by setting up, scraping the first page, and reading the documentation/tutorial.

    ![image](images/time_bd.png)

## Challenges
* Unable to scrap image links.
* Unable to scrap after page 25.

Refer to the markdown documents in [issues folder](issues), to know more.

## References/Tutorials
* [RealPython - Web Scraping and Crawling with Scrapy and MongoDB](https://realpython.com/web-scraping-and-crawling-with-scrapy-and-mongodb/)
    
    