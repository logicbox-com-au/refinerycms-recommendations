module Refinery
  module Recommendations
    class Recommendation < Refinery::Core::BaseModel
      extend FriendlyId
      self.table_name = 'refinery_recommendations'
      
      friendly_id :friendly_id_source, :use => [:slugged] 
      
      attr_accessible :name, :position, :role, :company, :company_url, :source_url, :publish_date, :description, :youtube_id, :photo_id, :widget_visible

      acts_as_indexed :fields => [:name, :company, :company_url, :source_url, :role, :description, :youtube_id]

      validates :name, :presence => true, :uniqueness => true
      
      belongs_to :photo, :class_name => '::Refinery::Image'
      
      def friendly_id_source
          "#{name} #{role} #{company}"
      end
      
    end
  end
end
