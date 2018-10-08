class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
      @comedians_specials = Special.where(comedian_id: @comedians.ids)
    else
      @comedians = Comedian.all
      @comedians_specials = Special.all
    end
    erb :"comedians/index"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  post '/comedians' do
    Comedian.create(params[:comedian])
    redirect "/comedians"
  end
end
