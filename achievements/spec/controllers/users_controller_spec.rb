require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET#new" do
        it 'renders the new user template' do
            get :new
            expect(response).to render_template('new')
        end
    end

    describe "POST#create" do
        context 'with invalid params' do
            it 'validates the presence of title and body' do
                post :create, params: { user: { title: 'this is an invalid user' } }
                expect(response).to render_template('new')
                expect(flash[:errors]).to be_present
            end
        end
        
        context 'with valid params' do
            it 'redirects to the user show page' do
                post :create, params: { user: { username: 'mittens', password: '123456' } }
                expect(response).to redirect_to(user_url(User.last))
            end
        end
    end
end

