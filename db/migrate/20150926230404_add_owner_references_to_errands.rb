class AddOwnerReferencesToErrands < ActiveRecord::Migration
  def change
    #add_reference :errands, :user, index: true, foreign_key: true
    #Changing this with Steve's help
    add_reference :errands, :owner, references: :users, index: true
    add_foreign_key :errands, :users, column: :owner_id
  end
end
