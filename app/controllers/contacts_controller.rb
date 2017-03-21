class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Your message has been sent and the ball's in our court now."
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      render new_contact_path
    end
  end




  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end

end
