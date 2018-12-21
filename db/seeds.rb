# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if !Privilege.find_by(name: 'Consultar')
  privileges = Privilege.create!([
                                     # Privilegios de Usuarios
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar la lista deusuarios y el perfil de cada usuario',
                                         str_id: 'user_1',
                                         module_name: 'Usuarios'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo usuario en el sistema',
                                         str_id: 'user_2',
                                         module_name: 'Usuarios'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar perfil de usuario',
                                         str_id: 'user_3',
                                         module_name: 'Usuarios'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar usuario del sistema',
                                         str_id: 'user_4',
                                         module_name: 'Usuarios'
                                     },
                                     {
                                         name: 'Des/activar',
                                         description: 'Activar / Desactivar usuario en el sistema. Una vez desactivado, no podrá ser asignado a nuevas clases',
                                         str_id: 'user_5',
                                         module_name: 'Usuarios'
                                     },
                                     # Privilegios de Rol
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar lista de roles',
                                         str_id: 'rbac_1',
                                         module_name: 'Rbac'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear nuevo rol de usuario',
                                         str_id: 'rbac_2',
                                         module_name: 'Rbac'
                                     },
                                     {
                                         name: 'Agregar Privilegios',
                                         description: 'Agregar privilegios a rol',
                                         str_id: 'rbac_3',
                                         module_name: 'Rbac'
                                     },
                                     {
                                         name: 'Editar Rol',
                                         description: 'Editar nombre de rol',
                                         str_id: 'rbac_4',
                                         module_name: 'Rbac'
                                     },
                                     {
                                         name: 'Eliminar Privilegio',
                                         description: 'Eliminar privilegio de rol',
                                         str_id: 'rbac_5',
                                         module_name: 'Rbac'
                                     },
                                     {
                                         name: 'Eliminar Rol',
                                         description: 'Eliminar rol de usuario',
                                         str_id: 'rbac_6',
                                         module_name: 'Rbac'
                                     }
                                 ]
  )
end

if !Role.find_by(name: 'Administrador')
  roles = Role.create!([
                           {
                               name: 'Súper Administrador'
                           },
                           {
                               name: 'Administrador de Proyecto'
                           },
                           {
                               name: 'Supervisor de Proyecto'
                           },
                           {
                               name: 'Cliente'
                           }
                       ]
  )
end

if !Roleprivilege.find_by(role_id: 1)
  role_privileges = Roleprivilege.create!([
                                              # "Súper Administrador" privileges
                                              {
                                                  role_id: 1,
                                                  privilege_id: 1
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 2
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 3
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 4
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 5
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 6
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 7
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 8
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 9
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 10
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 11
                                              }
                                          ]
  )
end

if !User.find_by(email: 'super@admin.com')
  users_admin = User.create!({
                                 name: 'Super',
                                 lastName: 'Administrador',
                                 password: 'adminpassword',
                                 password_confirmation: 'adminpassword',
                                 birthday: '1970-08-08',
                                 email: 'super@admin.com',
                                 phone: '4421234567',
                                 status: true,
                                 role_id: 1
                             })
end
