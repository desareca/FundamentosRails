class ApplicationController < ActionController::Base
    def current_form
        Formulario.find(session[:form_id]) if session[:form_id]
      end
    helper_method :current_form    
end
