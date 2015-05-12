class GroupMembershipsController < ApplicationController
  def create
    group_membership = GroupMembership.new(group_memebership_params)
    if group_membership.save
      render json: group_membership
    else
      render(json: group_membership.errors.full_messages,
              status: :unprocessable_entity)
    end
  end

  def destroy
    group_membership = GroupMembership.find_by(id: params[:id])
    if group_membership
      GroupMembership.destroy(group_membership)
      render json: group_membership
    else
      render text: 'Couldn\'t find group membership'
    end
  end

  private

  def group_memebership_params
    params.require(:group_membership).permit(:contact_group_id, :contact_id)
  end
end
