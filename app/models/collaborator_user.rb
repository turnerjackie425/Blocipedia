class CollaboratorUser < ActiveRecord::Base
  belongs_to :collaborator 
  belongs_to :user
end