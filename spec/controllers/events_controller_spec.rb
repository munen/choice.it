require 'spec_helper'

describe EventsController do

  context 'create new event' do
    it 'on create, it returns an access token' do
      post :create, { :format => :json },
        { :name => "foobar" }

      res = ActiveSupport::JSON.decode(response.body)
      res["access_token"].should_not be_nil
    end
  end

end
