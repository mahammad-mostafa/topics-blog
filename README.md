<a name="title"></a>

<!-- TITLE -->

# 🏷️ Topics Blog

This is the second project of the fifth module in the **Microverse** program.
<br/>
Check the below contents for further details about this project.

<!-- CONTENTS -->

# 📗 Contents

- [Description](#description)
- [Instructions](#instructions)
- [Authors](#authors)
- [Future](#future)
- [Contributions](#contributions)
- [Support](#support)
- [Acknowledgements](#acknowledgements)
- [License](#license)

<!-- DESCRIPTION -->

<a name="description"></a>

# 📖 Description

This repository is about a user blog with posts & likes.
Every post contains comments & likes.
It is built using `Rails` framework with `Ruby`.
The project is configured to use `PostgreSQL` database.
Unit tests are carried on models using `RSpec`.

📌 **Tech Stack:**
- Programming language is `Ruby`
- Database used is `PostgreSQL`
- Framework used is `Rails`
- Tests done with `RSpec`

📌 **Key Features:**
- Four database tables (`users` / `posts` / `comments` / `likes`)
- One to many relation between `users` & `posts` tables
- Both `comments` & `likes` are bridge tables for many to many relation between `users` & `posts` tables
- Four model files (`User` / `Post` / `Comment` / `Like`)
- Method `recent_posts` allows fetching the last three post for any user
- Method `recent_comments` allows fetching the last five comments for any post
- Private method `counter` auto increments the number of (`posts` / `comments` / `likes`) for the relevant owner table
- Several attribute validation rules for `User` & `Post` models
- Attributes (`name` / `title` / `posts_counter` / `comments_counter` / `likes_counter`) are required
- Attribute `title` length must be smaller than or equal 250 characters
- Attributes (`posts_counter` / `comments_counter` / `likes_counter`) must be an integer and greate than or equal zero
- Unit tests for attribute validation rules and model methods

<p align="right"><a href="#title">back to top</a></p>

<!-- INSTRUCTIONS -->

<a name="instructions"></a>

# 🛠️ Instructions

You can easily download or fork this repository and work on it immadiately!

📌 **Prerequisites:**
- You need `Ruby` language & `PostgreSQL` database installed

📌 **Installation:**
- To get all required gem dependencies run
```
bundle install
```
- Create all required databases & table schemas with
```
rails db:setup
```

📌 **Development:**
- Run live server using
```
rails server
```
- Manipulate & process models data through
```
rails console
```

📌 **Tests:**
- Run all unit test with
```
bundle exec rspec -f d
```

<p align="right"><a href="#title">back to top</a></p>

<!-- AUTHORS -->

<a name="authors"></a>

# 👥 Authors

📌 **Mahammad:**
- [GitHub](https://github.com/mahammad-mostafa)
- [Twitter](https://twitter.com/mahammad_mostfa)
- [LinkedIn](https://linkedin.com/in/mahammad-mostafa)

<p align="right"><a href="#title">back to top</a></p>

<!-- FUTURE -->

<a name="future"></a>

# 🔭 Future

Some additional features I may implement in the project:
- [ ] Integrate `React` framework in frontend
- [ ] Implement (dark / light) theme switch

<p align="right"><a href="#title">back to top</a></p>

<!-- CONTRIBUTIONS -->

<a name="contributions"></a>

# 🤝🏻 Contributions

Wish to contribute to this project?
<br/>
Contributions, issues, and feature requests are more than welcome!
<br/>
Feel free to check the [issues](../../issues) page too.

<p align="right"><a href="#title">back to top</a></p>

<!-- SUPPORT -->

<a name="support"></a>

# ⭐️ Support

Like this project? Show your support by starring!

<p align="right"><a href="#title">back to top</a></p>

<!-- ACKNOWLEDGEMENTS -->

<a name="acknowledgements"></a>

# 🙏🏻 Acknowledgements

I thank everyone at **Microverse** for guiding me through this project.

<p align="right"><a href="#title">back to top</a></p>

<!-- LICENSE -->

<a name="license"></a>

# 📝 License

This project is [MIT](LICENSE.md) licensed.

<p align="right"><a href="#title">back to top</a></p>