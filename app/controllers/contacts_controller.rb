class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "Message was sent."
    else
      render 'new', notice: "There was an error. Try again."
    end
  end




  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end

end
