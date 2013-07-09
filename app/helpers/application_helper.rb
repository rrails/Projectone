module ApplicationHelper
def intellinav
    if @auth.present?
      "<li>#{link_to 'Users', users_path}</li>" +
      "<li>#{link_to 'Create Call', new_call_path}</li>" +
      "<li>#{link_to 'Calls', calls_path}</li>" +
      # "<li>#{link_to 'Attendees', attendees_path}</li>"
      "<li>#{link_to('logout '+ @auth.name, login_path, :method => :delete,:confirm => 'Really?')}</li>"
    else
      "<li>#{link_to('Create Account',new_user_path)}</li>" +
      "<li>#{link_to('Login',login_path)}</li>"
    end
  end
end


