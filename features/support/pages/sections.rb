

class Navbar < SitePrism::Section
  element :user_menu, '.profil-link a[href*=dropdown]'
  element :link_logout, 'a[href$=logout]'

  def sair
    user_menu.click
    link_logout.click
  end
end

class Toast < SitePrism::Section
  element :message, '.toast-message'
end
