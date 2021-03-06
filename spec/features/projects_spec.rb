require 'rails_helper'

RSpec.describe "Projects", type: :feature do

  before(:all)do
    create_user
  end

  after(:all)do
    delete_user
  end

  before(:each)do
    visit root_path

    fill_in "session[email]", :with => "super@admin.com"
    fill_in "session[password]", :with => "adminpassword"
    click_button "Iniciar sesión"
  end

  context 'access projects index' do

    scenario "Visit home page" do
      visit '/projects'

      expect(page).to have_text("Proyectos")
      expect(page).to have_text("Registrar proyecto")
    end

    scenario "crate new project" do
      #visit new_project_path
      visit '/projects'
      click_link 'Registrar proyecto'
      expect(page).to have_text("Nuevo Proyecto")

      fill_in "project[name]", :with => "Inframex"
      fill_in "project[code]", :with => "P23-32"
      fill_in "project[start_date]", :with => Date.today
      fill_in "project[due_date]", :with => Date.today + 4.months
      fill_in "project[client]", :with => "Ing. Salomon"
      fill_in "project[address]", :with => Faker::Address.name
      click_button "Guardar"
      expect(page).to have_text("Éxito al crear el proyecto")
    end

  end

end
