# Scraping Flipkart section of men's t-shirt
## Installation
To run the project perform the following steps.
1. Copy the repo and install the modules required by typing:
    ```bash
    pip install -r requirements.txt
    ```
2. Open `settings.py` in `/flipkart_scrapper/flipkart_scrapper` folder, and enter proper values of variables 
    ```py
    MONGO_URI = 'mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]' # Enter mongodb uri

    MONGO_DATABASE = 'database_name' # Enter db name
    ```

    * If using local database, 
        * enable the `# LOCAL CONNECTION` code from `pipelines.py` and 
        * disable the `# REMOTE CONNECTION` code from `pipelines.py`
3. In terminal go to folder `/flipkart_scrapper/flipkart_scrapper` and run the spider by typing:
    ```bash
    scrapy crawl flipkart_men_tshirt
    ```

3. Output will be in the `/dump/output` folder, by the name `men_tshirt.csv`


## Intro
* A web scraper that scrapes data from a particular section of Flipkart, saves it in .csv format and loads the data to a remote MongoDB collection.

## Details
* The website to be scraped is flipkart.com, Men’s t-shirt section, direct link to the page is:
https://www.flipkart.com/men/tshirts/pr?sid=2oq%2Cs9b%2Cj9y&otracker=nmenu_sub_Men_0_T-Shirts&page=1


## Project structure

* assignment-2
    * /dump - contains all the response.html, resposne.json, trial_outputs.
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

## Challenges
* Unable to scrap image links.
* Unable to scrap after page 25.

Refer to the markdown documents in [issues folder](issues), to know more.

## References/Tutorials
* [RealPython - Web Scraping and Crawling with Scrapy and MongoDB](https://realpython.com/web-scraping-and-crawling-with-scrapy-and-mongodb/)
    
    
