desc <<-END_DESC
Send reminders about issues due in the next time.

Available options:
  * issue_id

Example:
  rake redmine:send_reminder_ticket issue_id=1 RAILS_ENV=production
END_DESC

namespace :redmine do
  task :send_reminder_ticket => :environment do
    options = {}
    options[:issue_id] = ENV['issue_id'].to_i if ENV['issue_id']
    Mailer.reminders(options)
  end
end
