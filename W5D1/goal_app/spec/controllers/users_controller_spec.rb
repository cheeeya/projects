require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'should render new' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'GET #show' do
    it 'should render show' do
      get :show, params: { id: 1 }
      expect(response).to render_template('show')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'should redirect to new user page on success' do
        post :create, params: { user: { username: 'john', password: 'password' } }
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context 'with  invalid params' do
      it 'should render new on failure' do
        post :create, params: { user: { username: 'john', password: 'short' } }
        expect(response).to render_template('new')
        # expect(page).to have_content('Password ')
      end
    end
  end
end
