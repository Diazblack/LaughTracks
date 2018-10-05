class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @comedians_specials = Special 
    erb :"comedians/index"
  end
end
