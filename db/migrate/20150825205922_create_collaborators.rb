class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :collaborators_users |t|
      t.integer :user_id
      t.integer :collaborator_id
      t.timestamps
    end

    add_index :users, :id, unique:true
    add_index :collaborators, :id, unique: true
    add_index :collaborators_users, :id, unique: true
    add_index :collaborators_users, :user_id
    add_index :collaborators_users, :collaborator_id
  end
end
