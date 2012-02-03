class Mailer
  def self.reminders(options={})
    issue_by_assignee = Issue.find(options[:issue_id])
    issue_by_assignee.each do |assignee, issues|
      deliver_reminder(assignee, issue, 1) if assignee && assignee.active?
    end
  end
end
