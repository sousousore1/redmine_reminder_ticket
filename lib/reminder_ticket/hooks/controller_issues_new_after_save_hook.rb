module ReminderTicket
  module Hooks
    class ControllerIssuesNewAfterSaveHooks < Redmine::Hook::ViewListener
      def controller_issues_new_after_save(context={})
        issue = context[:issue]
        if issue.tracker_id == 4
          tn = issue.id
          tr = "C:\\etc\\reminder_ticket.bat #{issue.id}"
          sc = "ONCE"
          sd = issue.start_date.strftime("%Y/%m/%d")
          st = issue.custom_field_values[0]
          system "schtasks /create /tn #{tn} /tr \"#{tr}\" /sc #{sc} /sd #{sd} /st #{st}" # ‚±‚±‚Åƒ^ƒXƒN‚ª“o˜^‚³‚ê‚é
        end
      end
    end
  end
end
