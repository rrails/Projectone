module ApplicationHelper
def intellinav
    if @auth.present?
      "<li>#{link_to('logout '+ @auth.name, login_path, :method => :delete,:confirm => 'Really?')}</li>"
    else
      "<li>#{link_to('Create Account',new_user_path)}</li>" +
      "<li>#{link_to('Login',login_path)}</li>"
    end
  end
end
