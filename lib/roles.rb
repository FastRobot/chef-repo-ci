# class for verifying and pushing roles

module ChefObjects
  class Roles
    SELECTOR = /roles.*(json|rb)$/

    def initialize(path, action, validate_only=false)
      # make sure the file exists
      raise "#{path} does not exist" unless ::File.exists?(path)

    end
  end
end