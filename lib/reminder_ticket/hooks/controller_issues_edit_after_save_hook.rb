module ReminderTicket
  module Hooks
    class ControllerIssuesEditAfterSaveHook < Redmine::Hook::ViewListener
      def controller_issues_edit_after_save(context={})
        begin
          issue = context[:issue]
          if issue.tracker_id == 4 and (issue.closing? or issue.closed?)
            tn = issue.id
            return system "schtasks /delete /f /tn #{tn}"
          end
        rescue
          return false
        end
      end
    end
  end
end
