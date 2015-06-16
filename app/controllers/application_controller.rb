class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_current_order
  helper_method :current_order
  
  def after_sign_in_path_for(resource)
    persons_profile_path                #переход в профиль после входа
  end

  def after_sign_out_path_for(resource_or_scope)
    welcome_index_path                   #переход на главную после выхода
  end


  private

    def check_current_order              #присвоение,создание нового заказа при входе
      if session[:current_order]
        @order ||= ::Order.find(session[:current_order])
      else
        if current_user.try(:admin?) && user_signed_in?
          @order = ::Order.create(user_id: current_user.try(:id))
          session[:current_order] = @order.id
        end
      end
    end

    def current_order                     #запрос на текущий заказ
      Order.find(session[:current_order]) if session[:current_order]
    end

end
