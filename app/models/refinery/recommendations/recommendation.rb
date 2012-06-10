module Refinery
  module Recommendations
    class Recommendation < Refinery::Core::BaseModel
      self.table_name = 'refinery_recommendations'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name, :company, :company_url, :source_url, :role, :description, :youtube_id]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
