class WorkflowPrompt < ActiveRecord::Base
    has_many :workflow_prompt_required_fields, dependent: :destroy
    accepts_nested_attributes_for :workflow_prompt_required_fields
end
