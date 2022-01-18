# Hotwire Kit

Kit builder with [Hotwire](https://hotwired.dev/)

# Config

- [Rails 7](https://rubyonrails.org/) with
  - [requestjs-rails](https://github.com/rails/requestjs-rails)
  - [pagy](https://github.com/ddnexus/pagy)
  - [pg_search](https://github.com/Casecommons/pg_search)
  - [tailwindcss-rails](https://github.com/rails/tailwindcss-rails)
- [Ruby 3](https://github.com/rbenv/rbenv)
- [PostgreSQL](https://formulae.brew.sh/formula/postgresql)
- [Redis](https://formulae.brew.sh/formula/redis)

- Run with `./bin/dev` to start both the rails server the tailwind watcher
- Make sure both `Redis` and `PostgreSQL` run also
- Once the db and migrated, you can run `rails db:seed` to create base data

# TODO

- Deploy to Heroku
- Disable prompt in options
- Disable flash after a few seconds
- Try css for table
- lazy loading the form
- Animation on turbo stream render + show/hide form fields
