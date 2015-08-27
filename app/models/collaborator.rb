class Collaborator < ActiveRecord::Base
  has_many :collaborators
  has_many :users, through: :collaborators_users
end