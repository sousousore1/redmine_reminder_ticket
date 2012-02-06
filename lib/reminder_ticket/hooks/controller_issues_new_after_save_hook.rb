module ReminderTicket
  module Hooks
    class ControllerIssuesNewAfterSaveHooks < Redmine::Hook::ViewListener
      def controller_issues_new_after_save(context={})
        begin
          issue = context[:issue]
          if issue.tracker_id == 4
            Schtasks.create_from_issue(issue)
          end
        rescue
          false
        end
      end
    end
  end
end
