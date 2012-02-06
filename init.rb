require 'redmine'
require 'time'
require_dependency 'schtasks'
require_dependency 'reminder_ticket/hooks/controller_issues_new_after_save_hook'
require_dependency 'reminder_ticket/hooks/controller_issues_edit_after_save_hook'

Redmine::Plugin.register :redmine_reminder_ticket do
  name 'Redmine Reminder Ticket plugin'
  author 'Souichi Saitou'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url ''
  author_url 'http://souichi.heroku.com'
end
