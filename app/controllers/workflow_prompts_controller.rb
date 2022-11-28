class WorkflowPromptsController < ApplicationController
    helper :custom_fields
    include Redmine::SafeAttributes

  def index
      @workflow_prompts = WorkflowPrompt.all
      @issue_statuses = IssueStatus.all
      @trackers = Tracker.all
  end
  def edit
      @workflow_prompt = WorkflowPrompt.find(params[:id])
      @workflow_prompt.workflow_prompt_required_fields.build
      @trackers = Tracker.all
      @issue_statuses = IssueStatus.order('position')
      @custom_fields = CustomField.all
  end
  def update
      WorkflowPrompt.find(params[:id]).workflow_prompt_required_fields.destroy_all
      if WorkflowPrompt.find(params[:id]).update(workflow_prompt_params)
          remove_redundant_wprfs
          redirect_to workflow_prompts_path
      else
          render :edit, status: :unprocessable_entity
      end
  end
  def new
      @prompts = WorkflowPrompt.new
      @prompts.workflow_prompt_required_fields.build
      @trackers = Tracker.all
      @issue_statuses = IssueStatus.order('position')
      @custom_fields = CustomField.all
  end
  def create
      @workflow_prompts = WorkflowPrompt.new(workflow_prompt_params)
      if @workflow_prompts.save
          remove_redundant_wprfs
          redirect_to workflow_prompts_path
      else
          render :new, status: :unprocessable_entity
      end
  end
  def workflow_prompt_params
      params.require(:workflow_prompt).permit(:label, :start_status, :end_status, :tracker, workflow_prompt_required_fields_attributes: [:required_field])
  end
  def destroy
      @workflow_prompt = WorkflowPrompt.find(params[:id])
      @workflow_prompt.destroy
      redirect_to workflow_prompts_path
  end
  
  def remove_redundant_wprfs
      WorkflowPromptRequiredField.where(required_field: 0).destroy_all
  end
   
  def transition
      @workflow_prompt = WorkflowPrompt.find(params[:id])
      @issue = Issue.find(params[:issue_id])
      @custom_fields = CustomField.all
      @custom_value = CustomValue.all
  end
  def transition_submit
  end
end
