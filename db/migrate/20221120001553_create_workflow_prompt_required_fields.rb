class CreateWorkflowPromptRequiredFields < ActiveRecord::Migration[6.1]
  def change
    create_table :workflow_prompt_required_fields do |t|
        t.belongs_to :workflow_prompt
        t.integer :required_field
    end
  end
end
