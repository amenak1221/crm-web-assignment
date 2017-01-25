require 'sinatra'

class Contact


  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  @@contacts = []
  @@next_id = 1000



  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id
  end

  #
  def self.create(first_name, last_name, email, note)
    #1.initialize a new contact with a unique ID
    new_contact = self.new(first_name, last_name, email, note)
    #2. add the new contact to the list of all contacts
    @@contacts << new_contact
    #3. Increment the next unique id
    @@next_id += 1
    new_contact
  end
# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
