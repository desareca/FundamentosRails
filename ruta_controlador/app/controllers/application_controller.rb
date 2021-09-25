class ApplicationController < ActionController::Base
    def hola
        render plain: 'Nuevo Producto creado.'    
    end
end
