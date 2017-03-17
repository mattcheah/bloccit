module TopicsHelper
   def user_is_authorized_for_new_topic?
      current_user && current_user.admin?
   end
   def user_is_authorized_for_deleting_topic?
      current_user && current_user.admin?
   end
   def user_is_authorized_for_editing_topic?
      current_user && (current_user.admin? || current_user.moderator?)
   end
end
