require_all 'lib'

# leave all chef managed object classes in module ChefObjects so that we can pull all constants
# out, extract the classes and apply each SELECTOR constant to a given file

module Test

  TEST = 'not a class'

  class Foo
    REGEX = /foo/
  end

  class Bar
    REGEX = /bar/
  end

end

# This will get all the classes in a module

module_classes = Test.constants.select { |c| Test.const_get(c).is_a? Class }

Test.const_get(module_classes[0])::REGEX