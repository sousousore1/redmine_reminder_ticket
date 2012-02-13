require 'redmine'
require 'time'
require 'csv'
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
  settings :default => {'target_tracker_id' => 4, 'target_custome_field_value_id' => 0, 'diff_time' => 3600, 'sc' => 'ONCE', 'ru' => nil, 'rp' => nil}, :partial => 'settings/redmine_reminder_ticket_settings'
end
