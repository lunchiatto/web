require 'spec_helper'

describe OrdersController, :type => :controller do
  let(:user) {create(:user)}

  describe 'POST create' do
    it 'creates an order' do
      sign_in user
      expect {
        post :create, user_id: user.id, from: 'A restaurant', format: :json
      }.to change(Order, :count)
    end
    describe 'json' do
      it 'rejects when not logged in' do
        post :create, user_id: user.id, from: 'A restaurant', format: :json
        expect(response).to have_http_status(401)
      end
      it 'returns success' do
        sign_in user
        post :create, user_id: user.id, from: 'A restaurant', format: :json
        expect(response).to have_http_status(:success)
      end
      it 'returns errors' do
        sign_in user
        post :create, from: 'A restaurant', format: :json
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT update' do
    let(:order) {create :order, user: user}
    describe 'json' do
      it 'rejects when not logged in' do
        put :update, id: order.id, format: :json
        expect(response).to have_http_status(401)
      end
      it 'returns success' do
        sign_in user
        other_user = create :other_user
        put :update, id: order.id, user_id: other_user.id, format: :json
        expect(response).to have_http_status(:success)
      end
      it 'returns errors' do
        sign_in user
        put :update, id: order.id, from: '', format: :json
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET show' do
    let(:order) {create :order, user: user}
    describe 'json' do
      it 'rejects when not logged in' do
        get :show, id: order.id, format: :json
        expect(response).to have_http_status(401)
      end
      it 'returns success' do
        sign_in user
        get :show, id: order.id, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT change_status' do
    let(:order) {create :order, user: user}
    describe 'json' do
      it 'rejects when not logged in' do
        put :change_status, id: order.id, format: :json
        expect(response).to have_http_status(401)
      end
      it 'returns success' do
        sign_in user
        put :change_status, id: order.id, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET :index' do
    let!(:order) {create :order, user: user, date: Date.today}
    let!(:order2) {create :order, user: user, date: Date.yesterday}
    let!(:order3) {create :order, user: user, date: 2.days.ago}
    describe 'json' do
      it 'rejects when not logged in' do
        get :index, format: :json
        expect(response).to have_http_status(401)
      end
      it 'returns json' do
        sign_in user
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end
      it 'returns all orders' do
        sign_in user
        get :index, format: :json
        expect(assigns(:orders).count).to eq(3)
      end
    end
  end

  describe 'GET :latest' do
    let(:order) {create :order, user: user}
    describe 'json' do
      it 'rejects when not logged in' do
        get :latest, format: :json
        expect(response).to have_http_status(401)
      end
      it 'renders json' do
        sign_in user
        get :latest, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
end