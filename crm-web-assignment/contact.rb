
require "pry"

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

  def self.all
    @@contacts
  end
  # def self.find(id)
  # @@contacts.each do |contact|
  #   if contact.id == id
  #     return contact
  #     end
  #   end
  # end

  def update(attribute, new_value)
    if "first_name" == attribute
      self.first_name = new_value
    elsif "last_name" == attribute
      self.last_name = new_value
    elsif "email" == attribute
      self.email = new_value
    elsif "note" == attribute
      self.note = new_value
    end
  end


  def self.find_by(attribute, value)
     @attribute = attribute
     @value = value
     @@contacts.each do |contact|
       if attribute == "first_name"
         if contact.first_name == value
         return contact
         end
       elsif attribute == "last_name"
         if contact.last_name == value
         return contact
         end
       elsif attribute == "email"
         if contact.email == value
         return contact
         end
       elsif attribute == "note"
         if contact.note == value
         return contact
         end
       elsif attribute == "id"
         return "no id"
       end
     end
   end

  def self.delete_all
    @@contacts = []
  end
  #
  def full_name
    return "#{first_name} #{last_name}"
  end

  # def delete
  #   @@contacts.delete(self)
  # end
end
