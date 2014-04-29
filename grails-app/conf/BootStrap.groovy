import com.yourapp.Role
import com.yourapp.User
import com.yourapp.UserRole
import grails.converters.JSON

class BootStrap {
  def grailsApplication

    def init = { servletContext ->
      if (!User.count()) {
        def mapDefaultRoles = [
          [username: 'test', password: 'secret'],

        ]

        createUsers(mapDefaultRoles)
      }


    }
    def destroy = {
    }


  def createUsers(map) {
    def rootRole = findRole('ROLE_ROOT', 'Super usuario')
    def adminRole = findRole('ROLE_ADMIN', 'Administrador del sistema')


    map.each { user ->
      println user.email
      def root = new User(user)
      def valid = root.validate()
      if (valid & !root.hasErrors()) {
        root.save(flush: true, insert: true)
        UserRole.create(root, adminRole, true)
        UserRole.create(root, rootRole, true)
      } else {
        println root.errors
      }
    }
  }


  //  Utily methods to create data
  private Role findRole(String authority, String description) {
    def result = Role.where {
      authority == authority
    }.get()

    if (!result) {
      result = new Role(authority: authority, description: description).save(flush: true, insert: true)
    }

    result
  }
}
