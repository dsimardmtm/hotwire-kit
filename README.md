# Hotwire Kit

Kit builder with [Hotwire](https://hotwired.dev/) ✨

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

Note that there is currently a small issue when deploying to prod with `@rails/request.js`. See the thread [here](https://github.com/rails/requestjs-rails/issues/5) and [here](https://discuss.hotwired.dev/t/importmap-error-rails-request-js-in-production-heroku-disables-turbolinks/3717)

# TODO

- Fix pagy page number not being passed in the URL on click
- Replace `sorting_controller.js` with an `index.turb_stream.erb`
