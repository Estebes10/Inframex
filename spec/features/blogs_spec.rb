require 'rails_helper'

RSpec.describe "Blogs", type: :feature do

  context 'if user is logged in' do

    scenario "User lists all blogs for project" do
      visit "/blogs"

      expect(page).to have_text("Registro de bitácoras por proyecto")
    end

    it 'shows error message'
    scenario 'shows Unauthorized error if user has not permissions' do
      # shows correct flow when user has not permissions
    end
  end

  context 'if user is not logged in' do
    it 'renders to loggin page'
    scenario 'renders ot loggin page' do
      # shows correct flow when user has not permissions
    end
  end

end
