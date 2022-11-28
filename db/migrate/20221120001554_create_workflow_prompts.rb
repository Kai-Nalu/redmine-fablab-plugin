class CreateWorkflowPrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :workflow_prompts do |t|
      t.string :label
      t.integer :start_status
      t.integer :end_status
      t.integer :tracker
    end
  end
end
