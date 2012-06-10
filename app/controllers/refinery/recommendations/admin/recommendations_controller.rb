module Refinery
  module Recommendations
    module Admin
      class RecommendationsController < ::Refinery::AdminController

        crudify :'refinery/recommendations/recommendation',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
