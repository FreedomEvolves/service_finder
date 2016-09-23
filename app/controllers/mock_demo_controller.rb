class MockDemoController < ApplicationController

  def mock_login_provider   
#binding.pry
    #num = Provider.last.id
    num = rand(4)+1
    cookies[:sf_user] = JSON.generate({type: 'provider', id: num})
    redirect_to provider_landing_path

  end

  def mock_login_client
#binding.pry
    #if @trace == 1
      #num = Client.last.id
    #else
      num = rand(4)+1
    #end
    cookies[:sf_user] = JSON.generate({type: 'client', id: num})
    redirect_to client_landing_path
  end
end