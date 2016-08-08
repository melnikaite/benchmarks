require 'grape'

module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    resource :statuses do
      desc 'Return a public timeline.'
      get :public_timeline do
        []
      end
    end
  end
end
