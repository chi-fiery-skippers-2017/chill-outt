require 'rails_helper'

RSpec.describe "Routing to the application", :type => :routing do
  xit "GET / routes to 'articles#index'" do
    expect(get: '/').to route_to('games#index')
  end
end
