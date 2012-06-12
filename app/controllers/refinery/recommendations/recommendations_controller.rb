module Refinery
  module Recommendations
    class RecommendationsController < ::ApplicationController

      before_filter :find_all_recommendations
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @recommendation in the line below:
        present(@page)
      end

      def show
        @recommendation = Recommendation.find(params[:id])
        @other_recommendations = Recommendation.find(:all, :conditions => ["slug != ?", params[:id]])
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @recommendation in the line below:
        present(@page)
      end

    protected

      def find_all_recommendations
        @recommendations = Recommendation.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/recommendations").first
      end

    end
  end
end
