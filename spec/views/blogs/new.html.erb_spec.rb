require 'rails_helper'

RSpec.describe 'blogs/new.html.erb', type: :view do

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end

  it 'infers the controller path' do
    expect(controller.request.fullpath).to eq new_blog_path
  end

  it 'displays the blog form' do
    blog = Blog.create!(
      name: 'Bitacora 23',
      description: 'una prueba',
      status: true,
      date: Date.today
    )
    #blog = FactoryBot.build(:blog)

    #render 'blogs/form', :blog => blog
    render :partial => 'blogs/form.html.erb', :locals => {:blog => blog}
    #expect(response).to render_template(:partial => '_form')

    expect(rendered).to match /Formulario de bitácora/
  end
end
