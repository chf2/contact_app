class ContactGroupsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @contact_groups = ContactGroup.where(user_id: params[:user_id])
    render json: @contact_groups
  end

  def show
    @contact_group = ContactGroup.find(params[:id])
    render json: @contact_group.group_contacts
  end

  def create
    contact_group = ContactGroup.new(contact_group_params)
    if contact_group.save
      render json: contact_group
    else
      render(json: contact_group.errors.full_messages,
              status: :unprocessable_entity)
    end
  end

  def destroy
    contact_group = ContactGroup.find_by(id: params[:id])
    if contact_group
      ContactGroup.destroy(contact_group)
      render json: contact_group
    else
      render text: 'Couldn\'t find contact group'
    end
  end

  def update
    contact_group = ContactGroup.find(params[:id])
    if contact_group.update(contact_group)
      render json: contact_group
    else
      render json: contact_group.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_group_params
    params.require(:contact_group).permit(:user_id, :group_name)
  end

end
