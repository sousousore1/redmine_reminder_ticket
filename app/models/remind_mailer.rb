class RemindMailer < Mailer
  def self.reminder_ticket(options={})
    issue = Issue.find(options[:issue_id])
    deliver_reminder_time(issue.assigned_to, issue) if issue.assigned_to && issue.assigned_to.active?
  end

  def reminder_time(user, issue)
    set_language_if_valid user.language
    recipients issue.recipients
    cc(issue.watcher_recipients - @recipients)
    subject l(:mail_subject_reminder_ticket, :start_time => issue.custom_field_values[0], :count => 1)
    body :issue => issue,
      :count => 1,
      :issue_url => url_for(:controller => 'issues', :action => 'show', :id => issue.id)
    render_multipart('reminder', body)
  end
end
