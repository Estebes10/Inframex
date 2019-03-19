require 'rails_helper'

RSpec.describe "Login", type: :feature do

  before(:all)do
    create_user
  end

  after(:all)do
    delete_user
  end

  context 'when user is not logged in' do

    scenario "Visit home page" do
      visit root_path

      expect(page).to have_text("Inicia Sesión")
      expect(page).to have_text("Recordar sesión")
    end

    scenario 'loggin with right credentials' do
      visit root_path

      fill_in "session[email]", :with => "super@admin.com"
      fill_in "session[password]", :with => "adminpassword"
      click_button "Iniciar sesión"
      expect(page).to have_text("Proyecto")
    end

  end

end
