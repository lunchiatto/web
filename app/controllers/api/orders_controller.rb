# frozen_string_literal: true
module Api
  class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize Order
      orders = Order.newest_first.page(params[:page]).includes(:dishes)
      render json: orders, shallow: true
    end

    def create
      order = Order.new order_params.merge(date: Time.zone.today)
      authorize order, :index?
      save_record order
    end

    def show
      order = find_order
      authorize order, :index?
      render json: order
    end

    def update
      order = find_order
      authorize order
      update_record order, order_params
    end

    def destroy
      order = find_order
      authorize order
      destroy_record order
    end

    def change_status
      order = find_order
      authorize order
      success = order.change_status(params[:status].to_sym)
      if success
        render json: order
      else
        render json: {errors: ['Operation not allowed']},
               status: :unprocessable_entity
      end
    end

    def latest
      authorize Order, :index?
      render json: Order.today, shallow: true
    end

    private

    def order_params
      params.permit(:user_id, :from, :shipping)
    end

    def find_order
      Order.find(params[:id])
    end
  end
end
