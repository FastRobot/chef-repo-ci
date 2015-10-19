# class for verifying and pushing Databags

module ChefObjects
  class Databag
    SELECTOR = /data_bag.*json$/
    @path = ''

    def initialize(path, action, validate_only=false)
      # make sure the file exists
      raise "#{path} does not exist" unless ::File.exists?(path)

    end

  end
end