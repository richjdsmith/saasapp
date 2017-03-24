class ContactsController < ApplicationController

  #  GET request to /contact-us
  #  Show new contact form
  def new
    @contact = Contact.new
  end

  # POST request to /contacts
  def create
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the contact object to database
    if @contact.save
      # store form fields via parameters into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into contact_mailer email method and send email.
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash and redirect to the new action
      flash[:success] = "Your message has been sent and the ball's in our court now."
      redirect_to new_contact_path
    else
      #If Contact object, store errors in flash hash and re-render the new form.
      flash[:danger] = @contact.errors.full_messages.join(", ")
      render :new
    end
  end




  private
    # To collect data from form, we must use strong parameters and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end

end
