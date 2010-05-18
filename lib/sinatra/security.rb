require 'sinatra/base'

module Sinatra
  module Security
    autoload :Helpers,        'sinatra/security/helpers'
    autoload :User,           'sinatra/security/user'
    autoload :Validations,    'sinatra/security/validations'
    autoload :Password,       'sinatra/security/password'
    autoload :Identification, 'sinatra/security/identification'
    autoload :LoginField,     'sinatra/security/login_field'

    def self.registered(app)
      app.helpers Helpers

      app.post '/login' do
        if authenticate(params)
          redirect_to_stored
        else
          session[:error] = "Wrong Username/Email and Password combination."
          redirect '/login'
        end
      end
    end
  end

  register Security
end
