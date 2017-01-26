require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "CRM"
  erb :index
end

get '/contacts' do
  @contact_name = 'Contacts'
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/')
end
