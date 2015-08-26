class CollaboratorUser < ActiveRecord::Base

  def self.users
    User.where( id: pluck(:user_id) )
  end

  def self.collaborators
    Collaborator.where( id: pluck(:collaborator_ id) )
  end

  def collaborator
    collaborator.find(collaborator_id)
  end

  def user
    User.find(user_id)
  end
end