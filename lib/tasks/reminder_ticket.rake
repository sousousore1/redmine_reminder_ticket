desc <<-END_DESC
Send reminders about issues due in the next time.

Available options:
  * issue_id

Example:
  rake redmine:send_reminder_ticket issue_id=1 RAILS_ENV=production
END_DESC

namespace :redmine do
  task :send_reminder_ticket => :environment do
    class RemindMailer < Mailer
      def self.reminder_ticket(options={})
        issues = []
        issue = Issue.find(options[:issue_id])
        issues << issue
        deliver_reminder(issue.assigned_to, issues, 1) if issue.assigned_to && issue.assigned_to.active?
      end
    end

    options = {}
    options[:issue_id] = ENV['issue_id'].to_i if ENV['issue_id']
    RemindMailer.reminder_ticket(options)
  end
end
