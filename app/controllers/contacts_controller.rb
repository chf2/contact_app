class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    @contacts = user.contacts
                      .where('name LIKE ? AND email LIKE ?',
                        "%#{params[:name]}%", "%#{params[:email]}%")
    @contacts.concat(user.shared_contacts
                      .where('name LIKE ? AND email LIKE ?',
                        "%#{params[:name]}%", "%#{params[:email]}%"))
    render json: @contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(json: contact.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact
      Contact.destroy(contact)
      render json: contact
    else
      render text: 'Couldn\'t find contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id, :favorite)
  end
end
