class AddAasmStateToErrands < ActiveRecord::Migration
  def change
    add_column :errands, :aasm_state, :string
  end
end
