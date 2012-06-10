# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Recommendations" do
    describe "Admin" do
      describe "recommendations" do
        login_refinery_user

        describe "recommendations list" do
          before(:each) do
            FactoryGirl.create(:recommendation, :name => "UniqueTitleOne")
            FactoryGirl.create(:recommendation, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.recommendations_admin_recommendations_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.recommendations_admin_recommendations_path

            click_link "Add New Recommendation"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Recommendations::Recommendation.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Recommendations::Recommendation.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:recommendation, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.recommendations_admin_recommendations_path

              click_link "Add New Recommendation"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Recommendations::Recommendation.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:recommendation, :name => "A name") }

          it "should succeed" do
            visit refinery.recommendations_admin_recommendations_path

            within ".actions" do
              click_link "Edit this recommendation"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:recommendation, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.recommendations_admin_recommendations_path

            click_link "Remove this recommendation forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Recommendations::Recommendation.count.should == 0
          end
        end

      end
    end
  end
end
