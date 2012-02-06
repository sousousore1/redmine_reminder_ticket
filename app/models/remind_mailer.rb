class RemindMailer < Mailer
  def self.reminder_ticket(options={})
    issue = Issue.find(options[:issue_id])
    deliver_reminder_time(issue.assigned_to, issue) if issue.assigned_to && issue.assigned_to.active?
  end

  def reminder_time(user, issue)
    set_language_if_valid user.language
    recipients issue.recipients
    cc(issue.watcher_recipients - @recipients)
    subject l(:mail_subject_reminder_ticket, :start_time => issue.custom_field_values[Setting.plugin_redmine_reminder_ticket['target_custome_field_value_id'].to_i], :count => Setting.plugin_redmine_reminder_ticket['diff_time'].to_i / 3600.0)
    body :issue => issue,
      :start_time => issue.custom_field_values[Setting.plugin_redmine_reminder_ticket['target_custome_field_value_id'].to_i],
      :count => Setting.plugin_redmine_reminder_ticket['diff_time'].to_i / 3600.0,
      :issue_url => url_for(:controller => 'issues', :action => 'show', :id => issue.id)
    render_multipart('reminder', body)
  end
end
