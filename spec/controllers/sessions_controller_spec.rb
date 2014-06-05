require 'spec_helper'
require 'spec_helper_functions'

describe SessionsController do
  before do
    @user = create_user
  end

  after do
    @user.delete
  end

  describe 'POST #create' do
    context 'Wrong user credentials' do
      it 'redirects to log_in form (non-persistent login)' do
        post :create, :email => @user.email, :password => 'wrong'
        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/Invalid/)
      end
    end

    context 'Correct user credentials (non-persistent login)' do
      it 'redirects to Recent Pages view' do
        post :create, :email => @user.email, :password => @user.password
        expect(response).to redirect_to(root_url)
        expect(session[:user_id]).to eq(@user.id)
      end
    end

    context 'Correct user credentials and remember_me' do
      it 'sets the cookie' do
        post :create, :email => @user.email, :password => @user.password, :remember_me => "1"
        expect(@user.remember_token).to_not be_blank 
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'logged in user logs out' do
      it 'logs user out' do
        post :create, :email => @user.email, :password => @user.password
        delete :destroy, :id => @user.id
        expect(response).to redirect_to(log_in_path)
      end
    end
  end
end
