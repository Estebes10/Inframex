require 'rails_helper'

RSpec.describe "Blogs", type: :feature do

  context 'when user is logged in' do
=begin
    scenario "User lists all blogs for project" do
      visit "/blogs"

      expect(page).to have_text("Registro de bitácoras")
    end

    scenario 'User creates a new blog' do
      visit "/blogs/new"

      expect(page).to have_text("Formulario de bitácora")
    end
=end
    it 'shows error message'
    #scenario 'shows Unauthorized error if user has not permissions'
  end

  context 'when user is not logged in' do
    it 'renders to loggin page'
    #scenario 'renders ot loggin page'
  end

end
