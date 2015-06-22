module ApplicationHelper
  def intellinav
    nav = ''
    if current_user.present? && current_user.profile.admin?
      nav += '<li>' + link_to('All posts', '/posts')
      nav += '<li>' + link_to('New post', '/posts/new')
      nav += '<li>' + link_to('All mentors', '/mentors')
      nav += '<li>' + link_to('New mentor', '/mentors/new')
    end
  end
end
