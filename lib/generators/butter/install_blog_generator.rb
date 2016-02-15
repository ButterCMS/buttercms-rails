module Butter
  module Generators
    class InstallBlogGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates ButterCMS initializer, controllers, views, and routes."
      def install
        # Create initializer
        copy_file "config/initializers/buttercms.rb", "config/initializers/buttercms.rb"

        # Create controllers
        directory "app/controllers/buttercms", "app/controllers/buttercms"

        # Create views
        directory "app/views/buttercms", "app/views/buttercms"

        # Create default layout
        directory "app/views/layouts/buttercms", "app/views/layouts/buttercms"

        # Add routes
        route %{
  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end
}

        puts "Success! Configure your API token in config/initializers/buttercms.rb, restart your server, and view your blog at /blog"
      end
    end
  end
end
