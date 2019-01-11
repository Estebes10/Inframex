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