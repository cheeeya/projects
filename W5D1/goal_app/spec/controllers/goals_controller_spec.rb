require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe 'GET #new' do
    it 'should render new' do
      get :new
      expect(response).to render_template('new')
    end

    it 'should provide user/password input' do
      get :new
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
    end
  end

  describe 'GET #show' do
    it 'should render show' do
      get :show
      expect(response).to render_template('show')
    end
  end

  describe 'GET #edit' do
    it 'should render edit' do
      get :edit
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do

  describe 'PATCH #update'

  describe 'DELETE #destroy'

end
