class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_action :check_current_order
  helper_method :current_order
  
  def after_sign_in_path_for(resource)
    persons_profile_path
  end

  def after_sign_out_path_for(resource_or_scope)
    welcome_index_path
  end

  private

    def check_current_order  
      if cookies[:current_order]
        @order ||= ::Order.find(cookies[:current_order])
      else
        if current_user.try(:admin?) && user_signed_in?
          @order = ::Order.create(user_id: current_user.try(:id))
          cookies[:current_order] = @order.id
        end
      end
    end

    def current_order
      Order.find(cookies[:current_order]) if cookies[:current_order]
    end

end
