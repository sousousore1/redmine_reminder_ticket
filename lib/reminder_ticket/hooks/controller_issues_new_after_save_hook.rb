module ReminderTicket
  module Hooks
    class ControllerIssuesNewAfterSaveHooks < Redmine::Hook::ViewListener
      def controller_issues_new_after_save(context={})
        issue = context[:issue]
        if issue.tracker_id == 4
          tn = issue.id
          tr = "C:\\redmine\\vendor\\plugins\\redmine_reminder_ticket\\lib\\bat\\reminder_ticket.bat #{issue.id}"
          sc = "ONCE"
          sd = issue.start_date.strftime("%Y/%m/%d")
          st = (Time.parse("#{sd} #{issue.custom_field_values[0]}") - 3600).strftime("%H:%M")
          system "schtasks /create /tn #{tn} /tr \"#{tr}\" /sc #{sc} /sd #{sd} /st #{st}"
        end
      end
    end
  end
end
