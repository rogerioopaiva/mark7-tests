require_relative 'sections'

class ProfilePage < SitePrism::Page
    section :navbar, Navbar, '.navbar'
end