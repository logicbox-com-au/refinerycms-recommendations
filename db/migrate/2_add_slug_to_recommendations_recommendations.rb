class AddSlugToRecommendationsRecommendations < ActiveRecord::Migration
    def up
      add_column :refinery_recommendations, :slus, :string
    end

    def down
      remove_column :refinery_recommendations, :slug
    end
end


