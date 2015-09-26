class AddUsersReferencesToErrands < ActiveRecord::Migration
  def change
    #add_reference :errands, :user, index: true, foreign_key: true
    # Changing this with Steve's help
    add_reference :errands, :runner, references: :users, index: true
    add_foreign_key :errands, :users, column: :runner_id
  end
end
