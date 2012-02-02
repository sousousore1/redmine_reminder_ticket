namespace :redmine do
  task :send_reminder_ticket => :environment do
    Mailer.reminder_ticket(issue)
  end
end
