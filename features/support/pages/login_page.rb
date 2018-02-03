require_relative 'sections'

class LoginPage < SitePrism::Page
  set_url '/'

  section :toast, Toast, '.toast'

  element :input_email, '#login_email'
  element :input_password, '#login_password'
  element :button_sign_in, '.btn-accent'

  def with(email, password)
    input_email.set email
    input_password.set password
    button_sign_in.click
  end
end
