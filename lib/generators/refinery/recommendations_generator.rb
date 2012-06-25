module Refinery
  class RecommendationsGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Refinery-Recomendations (including Assets)"

    def rake_db
      rake("refinery_recommendations:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Recommendations extension
Refinery::Recommendations::Engine.load_seed
        EOH
      end
    end
    
    def add_assets
      #insert_into_file "app/assets/javascripts/application.js", "//= require recommendations \n", :after => "jquery_ujs\n"

      # Add our own require:
      content = File.read("app/assets/stylesheets/application.css")
      if content.match(/require_tree\s+\.\s*$/)
        # Good enough - that'll include our recommendationd.css
      else
        style_require_block = " *= require recommendations\n"
        insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => "require_self\n"
      end
      
      #copy_file "recommendations.js", "app/assets/javascripts/recommendations.js"
      #copy_file "recommendations.css.scss", "app/assets/stylesheets/recommendations.css.scss"
      #directory 'images', 'app/assets/images'
      directory 'helpers', 'app/helpers'
    end
  end
end