# ButterCMS Rails Blog Generator 

This repo provides a generator that expedites setup of your ButterCMS blog into a currently existing Rails project.
This repo is no longer being currently maintained; however, if you'd like to try out ButterCMS and Rails 
with our new [Rails Starter Project](https://buttercms.com/starters/rails-starter-project/), you can
be up and running with a Rails + ButterCMS project within two minutes--including a hosted deployment
to Heroku!

## Documentation

For a comprehensive list of examples and API docs, check out our [documentation](https://buttercms.com/docs/).

### Installation

To get started, first install the gem by adding it to your Gemfile:

```
gem 'buttercms-rails'
```

After installing, run the genereator provided by the gem:

```
rails generate butter:install_blog
```

The generator creates an initializer file and default controllers and views:

```
|-- app
    |-- controllers
        |-- buttercms
            |-- authors_controller.rb
            |-- base_controller.rb
            |-- categories_controller.rb
            |-- feeds_controller.rb
            |-- posts_controller.rb
    |-- views
        |-- buttercms
            |-- authors
                |-- show.html.erb
            |-- categories
                |-- show.html.erb
            |-- posts
                |-- _post.html.erb
                |-- index.html.erb
                |-- show.html.erb
        |-- layouts
            |-- buttercms
                |-- default.html.erb

|-- config
    |-- initializers
        |-- buttercms.rb
```

It also adds routes to your `routes.rb`  file:

```ruby
  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end
```

After running the generator, set your API token in `config/initializers/buttercms.rb` and then start your server to view your blog.

### Customization

Extending and customizing your blog is easy. The ButterCMS Rails SDK uses the [ButterCMS Ruby API Client](https://github.com/buttercms/buttercms-ruby). Email [support@buttercms.com](mailto:support@buttercms.com) for help!

### Fallback Data Store

The ButterCMS Ruby client supports automatic fallback to a data store when API requests fail. Learn more in the [buttercms-ruby README](https://github.com/buttercms/buttercms-ruby/tree/master#fallback-data-store).

### Test mode

Test mode can be used to setup a staging website for previewing content or for testing content during local development. To fetch content from test mode add the following to your initializer:

```ruby
ButterCMS::test_mode = true
```

### Other

View Rails [Blog engine](https://buttercms.com/rails-blog-engine/) and [Full CMS](https://buttercms.com/rails-cms/) for other examples of using ButterCMS with Rails.
