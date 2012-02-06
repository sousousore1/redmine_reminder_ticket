system "cd #{RAILS_ROOT}"
system "rake redmine:send_reminder_ticket issue_id=#{ARGV[0]} RAILS_ENV=#{RAILS_ENV}"
