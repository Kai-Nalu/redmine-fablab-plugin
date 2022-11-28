require 'redmine'

Redmine::Plugin.register :fablab_plugin do
  name 'Fablab Plugin'
  author 'Kai Nieto Gonzalez'
  description 'Utilities for RIT FabLab'
  version '1.0.0'
  url 'https://github.com/Kai-Nalu/redmine-fablab-plugin'
  author_url 'https://github.com/Kai-Nalu'
  
  menu :admin_menu, :workflow_prompts, { controller: 'workflow_prompts', action: 'index' }, caption: 'Workflow Prompts'
end

require File.expand_path('../lib/fablab_plugin/hooks/view_issues_show_details_bottom_hook', __FILE__)
