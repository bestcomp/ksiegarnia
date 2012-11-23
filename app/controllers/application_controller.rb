
class ApplicationController < ActionController::Base

    protect_from_forgery
before_filter :ustawkoszyk
	helper_method :current_cart

    private
	def ustawkoszyk
	@cart = current_cart
	end
      def current_cart
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
      end
  end

