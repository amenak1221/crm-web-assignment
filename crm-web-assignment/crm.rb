require_relative 'contact'
require 'sinatra'

# Contact.create('Marty', 'McFly', 'marty@mcfly.com', 'CEO')
# Contact.create('George', 'McFly', 'george@mcfly.com', 'Co-Founder')
# Contact.create('Lorraine', 'McFly', 'lorraine@mcfly.com', 'Co-Founder')
# Contact.create('Biff', 'Tannen', 'biff@tannen.com', 'Co-Founder')
# Contact.create('Doc', 'Brown', 'doc@brown.com', 'Co-Founder')
#


get '/' do
  @crm_app_name = "Amena's CRM"
  erb :index
end

get '/contacts' do
  @contact_name = 'Contacts'
  erb :contact
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra: :NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    #if the contact exists update the following properties from the params hash (data received from the browser)
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    # action to save a contact in the database
    @contact.save

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end
get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end

after do
  ActiveRecord::Base.connection.close
end
