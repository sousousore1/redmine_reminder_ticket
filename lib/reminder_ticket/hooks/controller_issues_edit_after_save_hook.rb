module ReminderTicket
  module Hooks
    class ControllerIssuesEditAfterSaveHook < Redmine::Hook::ViewListener
      def controller_issues_edit_after_save(context={})
        begin
          issue = context[:issue]
          if issue.tracker_id == Setting.plugin_redmine_reminder_ticket['target_tracker_id'].to_i
            if issue.closing? or issue.closed?
              Schtasks.delete_from_issue(issue)
            else
              Schtasks.delete_from_issue(issue)
              Schtasks.create_from_issue(issue)
            end
          end
        rescue
          false
        end
      end
    end
  end
end
