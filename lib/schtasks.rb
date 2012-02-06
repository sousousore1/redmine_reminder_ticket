module Schtasks
  def self.create_from_issue(issue)
    options = {}
    options[:tn] = issue.id
    options[:tr] = "#{RAILS_ROOT}/vendor/plugins/redmine_reminder_ticket/lib/bat/reminder_ticket.bat #{issue.id}"
    options[:sc] = Setting.plugin_redmine_reminder_ticket['sc']
    options[:sd] = issue.start_date.strftime("%Y/%m/%d")
    options[:st] = (Time.parse("#{options[:sd]} #{issue.custom_field_values[Setting.plugin_redmine_reminder_ticket['target_custome_field_value_id'].to_i]}") - Setting.plugin_redmine_reminder_ticket['diff_time'].to_i).strftime("%H:%M")
    options[:ru] = Setting.plugin_redmine_reminder_ticket['ru']
    options[:rp] = Setting.plugin_redmine_reminder_ticket['rp']
    create(options)
  end

  def self.create(options)
    return unless options
    system "schtasks /create /tn \"#{options[:tn]}\" /tr \"#{options[:tr]}\" /sc \"#{options[:sc]}\" /sd \"#{options[:sd]}\" /st \"#{options[:st]}\" /ru \"#{options[:ru]}\" /rp \"#{options[:rp]}\""
  end

  def self.delete_from_issue(issue)
    options = {}
    options[:tn] = issue.id
    delete(options)
  end

  def self.delete(options)
    return unless options
    system "schtasks /delete /f /tn #{options[:tn]}"
  end

end
