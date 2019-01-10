require 'rails_helper'

RSpec.describe "Login", type: :feature do

  before(:each)do
    @role = FactoryBot.create(:role)
    @user = User.create!({
       name: 'Super',
       lastName: 'Administrador',
       password: 'adminpassword',
       password_confirmation: 'adminpassword',
       birthday: '1970-08-08',
       email: 'super@admin.com',
       phone: '4421234567',
       status: true,
       role_id: @role.id
   })
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
      expect(page).to have_text("Proyectos")
    end

  end

end
