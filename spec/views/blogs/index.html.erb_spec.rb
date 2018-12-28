require 'rails_helper'

RSpec.describe 'blogs/_index.html.erb', type: :view do

  context 'with 2 blogs' do
    before(:each) do
      assign(:blogs, [
        FactoryBot.create(:blog, name: 'Bitacora B1'),
        FactoryBot.create(:blog, name: 'Bitacora B2')
      ])
    end

    it 'displays both blogs' do
      render

      # Test if the name of both objects are rendered
      expect(rendered).to match /Bitacora B1/
      expect(rendered).to match /Bitacora B2/
    end

    it 'infers the controller path' do
      expect(controller.request.path_parameters[:controller]).to eq('blogs')
      expect(controller.controller_path).to eq('blogs')
    end

    it 'infers the controller action' do
      expect(controller.request.path_parameters[:action]).to eq('index')
    end
  end

end
