module KnifeThrower
  def self.loader(git_changeset)
    results = Array.new
    git_changeset.each_line do |change_row|
      action, file = change_row.split("\t")
      results << { file.chomp => action }
    end
    results
  end

  def self.get_regex_by_class
    klass = Hash.new
    module_classes = ChefObjects.constants.select { |c| ChefObjects.const_get(c).is_a? Class }
    module_classes.each { |m| klass[m] = ChefObjects.const_get(m)::SELECTOR }
    klass
  end

  def self.apply_change(file, action, validate_only=false)
    # given a single file and action, figure out which class takes care of it and dispatch
    class_to_apply = KnifeThrower.get_regex_by_class.select { |c,r| file =~ r }
    # now send whatever action as a method to the class we picked
    ChefObjects.const_get(class_to_apply.keys.first).new(file,action, validate_only)
  end

end