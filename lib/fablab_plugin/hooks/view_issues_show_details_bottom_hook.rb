module FablabPlugin
    module Hooks
      class ViewIssuesShowDetailsBottomHook < Redmine::Hook::ViewListener
          workflow_prompts = WorkflowPrompt.all
          issue_statuses = IssueStatus.all
          trackers = Tracker.all
          render_on(:view_issues_show_details_bottom, :partial => 'hooks/button', locals: { workflow_prompts: workflow_prompts, issue_statuses: issue_statuses, trackers: trackers })
      end
    end
end
