# README

Hello world.

This repository is meant to facilitate order processing and tracking for small (low-tech) businesses that deliver goods and offer catering services to a local clientele. We are building a mobile web-based user interface for small business owners to log new orders after an in-person or over the phone point of sale.

This project utilizes:
- Ruby on Rails 7 backend supported by a PostegreSQL database and GraphQL. 
- On the frontend, we have React JS powered by data from GraphQL queries.

Steps to run your own instance of this app on your computer:
- `gh repo clone AbelRR/events_plus_plus_v3` to clone the repo to a local directory
- create a db on your computer or set one up remotely and connect it in the db config file in db/ folder
- run `bin/rake db:migrate`, `bundle i`, `npm i`
- `npm run watch`