module Refinery
  module Recommendations
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Recommendations

      engine_name :refinery_recommendations

      initializer "register refinerycms_recommendations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "recommendations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.recommendations_admin_recommendations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/recommendations/recommendation',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Recommendations)
      end
    end
  end
end
