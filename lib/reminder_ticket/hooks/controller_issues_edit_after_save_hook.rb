module ReminderTicket
  module Hooks
    class ControllerIssuesEditAfterSaveHook < Redmine::Hook::ViewListener
      def controller_issues_edit_after_save(context={})
        issue = context[:issue]
        if issue.tracker_id == 4 and issue.is_closed
          tn = issue.id
          system "schtasks /delete /f /tn #{tn}"
        end
      end
    end
  end
end
