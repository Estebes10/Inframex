require "rails_helper"

RSpec.describe 'routes for blogs', :type => :routing do

  context 'for index method' do
    it "should route to /blogs" do
      expect(:get => "/blogs").to be_routable
    end

    it "routes /blogs to blogs controller" do
      expect(get("/blogs")).to route_to("blogs#index")
    end
  end

end
