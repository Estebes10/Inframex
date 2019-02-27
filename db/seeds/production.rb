load File.expand_path('../production/privileges.rb', __FILE__ )
puts "===============================# Privileges loaded #=========================="

load File.expand_path('../production/roles.rb', __FILE__ )
puts "===============================# Roles loaded #==============================="

load File.expand_path('../production/roleprivileges.rb', __FILE__ )
puts "===============================# Roleprivileges loaded #======================"

load File.expand_path('../production/users.rb', __FILE__ )
puts "===============================# Users loaded #==============================="

load File.expand_path('../production/categories.rb', __FILE__ )
puts "===============================# Categories loaded #=========================="

load File.expand_path('../production/subcategories.rb', __FILE__ )
puts "===============================# Subategories loaded #========================"
