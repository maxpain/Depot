class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 # skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }
  
  def after_sign_in_path_for(resource)
    persons_profile_path
  end

  def after_sign_out_path_for(resource_or_scope)
    welcome_index_path
  end

  prepend_before_action :check_current_order

  helper_method :current_order

  private

    def check_current_order  

      if session[:current_order]
        @order ||= ::Order.find(session[:current_order])
      else
  #          if user_signed_in?
   #   if current_user.admin? 
        @order = ::Order.create(user_id: current_user.try(:id))
        session[:current_order] = @order.id
      end
  #  end
#  end
    end

    def current_order
      Order.find(session[:current_order]) if session[:current_order]
    end



end
