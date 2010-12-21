require 'sinatra/base'

class ZenGarden < Sinatra::Base
  set :haml, :format => :html5

  helpers do
    def stylesheet()
      if params[:stylesheet]
        ""
      else
        "/css/style.css"
      end
    end
  end

  get '/' do
    haml :index, :locals => { :stylesheet => stylesheet } 
  end
end
