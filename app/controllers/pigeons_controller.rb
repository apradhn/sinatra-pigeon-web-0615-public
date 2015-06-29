# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController

  get '/pigeons' do 
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end  

  get '/pigeons/:id' do
    id = params[:id]
    @pigeon = Pigeon.find(id)
    erb :'pigeons/show'
  end

  get '/pigeons/:id/edit' do 
    id = params[:id]
    @pigeon = Pigeon.find(id)
    erb :'pigeons/edit'
  end

  post '/pigeons' do
    Pigeon.create(name: params[:name], gender: params[:gender], color: params[:color], lives: params[:lives])
    redirect('/pigeons')
  end

  delete '/pigeons/:id' do
    Pigeon.destroy(params[:id])
    redirect('/pigeons')
  end

  patch '/pigeons/:id' do
    Pigeon.update(params[:id], name: params[:name], gender: params[:gender], color: params[:color], lives: params[:lives])
    redirect('/pigeons/'+params[:id])
  end

end