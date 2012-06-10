class CreateRecommendationsRecommendations < ActiveRecord::Migration

  def up
    create_table :refinery_recommendations do |t|
      t.string :name
      t.string :role
      t.string :company
      t.string :company_url
      t.string :source_url
      t.datetime :publish_date
      t.text :description
      t.string :youtube_id
      t.integer :photo_id
      t.boolean :widget_visible
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-recommendations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/recommendations/recommendations"})
    end

    drop_table :refinery_recommendations

  end

end
