module ReminderTicket
  module Hooks
    class ControllerIssuesEditAfterSaveHook < Redmine::Hook::ViewListener
      def controller_issues_edit_after_save(context={})
        issue = context[:issue]
        if issue.tracker_id == 4 and (issue.status_id == 5 or issue.status_id == 6)
          tn = issue.id
          system "schtasks /delete /f /tn #{tn}"
        end
      end
    end
  end
end
