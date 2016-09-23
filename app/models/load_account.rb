class LoadAccount
  attr_reader :cookie, :id, :account

  def run(user_cookie = {})
    @cookie = JSON.parse(user_cookie)
    @id = @cookie['id'].to_i

    case @cookie['type']
      when 'provider'
        @account = Provider.find(id)   
#binding.pry
      when 'client'
        @account = Client.find(id)
#binding.pry
    end
    return @account
  end
end
