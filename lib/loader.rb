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
  end

end