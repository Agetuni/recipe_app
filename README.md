# RoR group project (Recipe App)

> The Recipe app keeps track of all the users' recipes, ingredients, and inventory. It allows users to save ingredients, keep track of what they have, create recipes, and generate a shopping list based on what they have and what is missing from a recipe. Also, since sharing recipes is an important part of cooking the app allows users to make them public so anyone can access them.

### Online Demo

### Quick Preview



# How to build the Recipe app
The end result should follow the following data model (this is an Entity Relationship Diagram that you are already familiar with):

> ![](https://github.com/microverseinc/curriculum-rails/blob/main/recipe-app/images/recipe_app_erd.png)

## Built With

- Ruby on Rails
- Bootstrap
- JQuery
- Ruby
- Bubocop
- Gems
  - Rspec
  - Capybara
  - Selenium-webdriver
  - Bcrypt
  - Letter-opener
  - cancancan
  - Devise
  - FactoryBot


## Getting Started

**To get a local copy up and running follow these simple example steps.**

### Prerequisites
- Ruby should be installed on your machine
- Install Ruby on Rails and PostgresQL

### Setup
```
git clone https://github.com/Agetuni/recipe_app.git
cd recipe_app
```
### Install
```
bundle install
```

### Play with the code
```
rails c
```

### Populate the db with dummy data
```
rake db:migrate
rake db:seed
```

### Run linters
```
rubocop -A
```

### Start the application
```
rails s
```

### Tests
```
rspec spec (run all tests)
rspec spec/name_of_folder/name_of_file.rb (run specific tests)
```
### Authors

## 👤 *Tadesse Jemal*

- GitHub: [@Tadessejemal1](https://github.com/Tadessejemal1)
- Twitter: [@twitterhandle](https://twitter.com/tadesse)
- LinkedIn: [@tadesse-jemal](https://linkedin.com/in/tadesse-jemal)


## 👤 Aleazar Yilma

- GitHub: [@Agetuni](https://github.com/Agetuni)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/aleazaryilma/)
- AngelList: [timo-wester](https://angel.co/u/aleazar-yilma-1)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Many thanks to Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.
