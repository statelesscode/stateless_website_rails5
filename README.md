# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version
  * Built on 2.4.0
  * Requires Ruby >= 2.3.0

* System dependencies: TBD

* Configuration \
  In order to get the application to run, you need to set the following environment variables:
  * $STATELESS\_DEV\_SECRET\_KEY\_BASE
  * $STATELESS\_DEVISE\_PEPPER\_DEV
  * $STATELESS\_TEST\_SECRET\_KEY\_BASE
  * $STATELESS\_DEVISE\_PEPPER\_TEST
  * $STATELESS\_PRD\_SECRET\_KEY\_BASE
  * $STATELESS\_DEVISE\_PEPPER\_PROD

### Database creation
```
$ rails db:create
```

### Database initialization
```
$ rails db:migrate
```

or

```
$ rails db:schema:load
```


### How to run the test suite

```
$ rails test
```

### Services (job queues, cache servers, search engines, etc.)

* TBD

### Hosting/Deployment instructions

* Deployment TBD
* Hosting TBD
* Needs to be able to support automated deployment like Chef
* Need to be able to control Ruby environmen (eliminates most shared hosting options)

## Behavior Specifications
  * Will contain video (screencasts), audio (podcasts), and blog posts (articles)
  * Needs to have ability for screencasts, podcasts, and articles to be commented on and have ability for comments to be nested. (polymorphic association)
  * Need to have show notes pages for audio/video content
  * Need to have ability to tag posts with keywords/categories
  * Need to have role-based access to tiered and/or premium content
  * Need to have ability to get paid (fiat/bitcoin)
  * Need to have analytics to determine most profitable lines of business
    * Click, referral tracking, etc.
  * Need to have ability to serve targeted advertisements to Stateless Code or affiliate products
  * Need to have ability to allow users to sign up to email list
  * Need to have ability to split test emails/ads/campaigns
  * Need to have ability to route /root/podcasts/:id to root/:id
  * Need to have ability for users to sign up, sign in, confirm, unlock, etc.
  * Need to have ability for users to share content on Facebook, Twitter, etc.
  * Need to have ability to sell/serve ebooks
  * Stateless chat for members (implement with ActionCable)
  * Forums for members


### Front End
  * Colors
    * Primary Hue (Stateless Blue) is 233
    * Secondary Hue (Stateless Gold) is 53
    * Tertiary Hues are 323 and 143
  * Bootstrap
    * Using SASS version 4, currently in alpha
  * Turbolinks
  * JQuery

### Back end
  * Will use SQLite and Puma for dev, likely Postgres and Apache with Passenger for prod

## How to make money
* Subscriptions for premium content
  * Coding screencasts
  * Potential knowledge tests, adaptive learning (later phase)
  * Walkthroughs on how to use emerging technologies, especially ones that appeal to Libertarian principles like privacy (Tor) or free market money (Bitcoin)
* Affiliate marketing Technology and Libertarian affiliates preferred
  * Promote on podcasts
  * Serve and target ads in sidebars
* Promote to email list (there is money in the ~~banana stand~~ email list)
  * Free ebook incentives to join the email list
  * Free course incentives to join the email list
* Premium ebooks (later phase)
* Potential coaching/mastermind super-premium (later phase)
