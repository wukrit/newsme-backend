# NewsMe

## What is NewsMe?
NewsMe is an an AI enhanced news application. NewsMe allows users to subscribe to topics they are interested in and recieve a customized newsfeed. NewsMe also allows users to get their daily newsfeeds sent to them via html or text email.

## How does it work?
### Back-End

NewsMe's API is built with Ruby on Rails, utilizing JWT and BCrypt for security, and PostgreSQL for its database. ActionMailer is utilized to create HTML and text emails which are sent out using a scheduled rake task.

NewsMe gathers the top headlines from hundreds of
global sources by using [NewsApi](https://newsapi.org/).

Then we use [Aylien](https://aylien.com/) natural language processing to summarize articles into digestable summaries. Now you can stay informed without having to read through hundreds of sentences.

### Front-End
[Link to Front-End Repo](https://github.com/wukrit/newsme-frontend)
NewsMe is built using React as its front-end framework.

React hooks as well as Redux are utilized in order to manage stateful logic and to create a cohesive UX.



## Installation

    Clone repo and CD into the directory
    bundle install
    run rails db:create to create your postgres database
    run rails db:migrate to bring up migrations
    run rails db:seed to seed data for shops and items
    run rails s to start the server

Make sure to checkout the repo for the frontend and follow the installation instructions as well.
