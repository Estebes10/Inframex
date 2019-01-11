# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Priv
# Role
# RolePri
# User

load File.expand_path('../seeds/privileges.rb', __FILE__ )
puts "===============================# Privileges loaded #=========================="

load File.expand_path('../seeds/roles.rb', __FILE__ )
puts "===============================# Roles loaded #==============================="

load File.expand_path('../seeds/roleprivileges.rb', __FILE__ )
puts "===============================# Roleprivileges loaded #======================"

load File.expand_path('../seeds/users.rb', __FILE__ )
puts "===============================# Users loaded #==============================="

load File.expand_path('../seeds/categories.rb', __FILE__ )
puts "===============================# Categories loaded #=========================="

load File.expand_path('../seeds/subcategories.rb', __FILE__ )
puts "===============================# Subategories loaded #========================"
