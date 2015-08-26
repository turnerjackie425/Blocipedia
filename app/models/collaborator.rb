class Collaborator < ActiveRecord::Base
  def collaborators_users
    collaborator_user.where(collaborator_id: id)
  end

  def users
   collaborators.users
  end
end