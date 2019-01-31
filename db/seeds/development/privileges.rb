if !Privilege.find_by(name: 'Consultar')
  privileges = Privilege.create!([
                                     # Privilegios de Usuarios
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar la lista de usuarios y el perfil de cada usuario',
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
                                     #10
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
                                     },
                                     # Privilegios de categorías
                                     {
                                         name: 'Crear',
                                         description: 'Crear una nueva categoría en el sistema',
                                         str_id: 'category_1',
                                         module_name: 'Categorías'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar categoría en el sistema',
                                         str_id: 'category_2',
                                         module_name: 'Categorías'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar categoría del sistema',
                                         str_id: 'category_3',
                                         module_name: 'Categorías'
                                     },
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar categorías y subcategorías en el sistema',
                                         str_id: 'category_4',
                                         module_name: 'Categorías'
                                     },
                                     # Privilegios de subcategorías
                                     {
                                         name: 'Crear',
                                         description: 'Crear una nueva subcategoría en el sistema',
                                         str_id: 'subcategory_1',
                                         module_name: 'Subcategorías'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar subcategoría en el sistema',
                                         str_id: 'subcategory_2',
                                         module_name: 'Subcategorías'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar subcategoría del sistema',
                                         str_id: 'subcategory_3',
                                         module_name: 'Subcategorías'
                                     },
                                     # Privilegios de Proyectos
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar los proyectos y entrar a cada uno',
                                         str_id: 'project_1',
                                         module_name: 'Proyectos'
                                     },
                                     #20
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo proyecto en el sistema',
                                         str_id: 'project_2',
                                         module_name: 'Proyectos'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar proyecto en el sistema',
                                         str_id: 'project_3',
                                         module_name: 'Proyectos'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar proyecto del sistema',
                                         str_id: 'project_4',
                                         module_name: 'Proyectos'
                                     },
                                     # Privilegios de Bitácoras
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar las bitácoras y entrar a cada uno',
                                         str_id: 'blog_1',
                                         module_name: 'Bitácoras'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear una nueva bitácora en el sistema',
                                         str_id: 'blog_2',
                                         module_name: 'Bitácoras'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar bitácora en el sistema',
                                         str_id: 'blog_3',
                                         module_name: 'Bitácoras'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar bitácora del sistema',
                                         str_id: 'blog_4',
                                         module_name: 'Bitácoras'
                                     },
                                     {
                                         name: 'Des/activar',
                                         description: 'Activar / Desactivar bitácora en el sistema',
                                         str_id: 'blog_5',
                                         module_name: 'Bitácoras'
                                     },
                                     # Privilegios de Conceptos
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar los conceptos y entrar a cada uno',
                                         str_id: 'concept_1',
                                         module_name: 'Conceptos'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo concepto en el sistema',
                                         str_id: 'concept_2',
                                         module_name: 'Conceptos'
                                     },
                                     #30
                                     {
                                         name: 'Editar',
                                         description: 'Editar concepto en el sistema',
                                         str_id: 'concept_3',
                                         module_name: 'Conceptos'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar concepto del sistema',
                                         str_id: 'concept_4',
                                         module_name: 'Conceptos'
                                     },
                                     # Privilegios de Gastos
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar los gastos y entrar a cada uno',
                                         str_id: 'expenses_1',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo gasto en el sistema',
                                         str_id: 'expenses_2',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar gasto en el sistema',
                                         str_id: 'expenses_3',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar gasto del sistema',
                                         str_id: 'expenses_4',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Des/activar',
                                         description: 'Aprobar / Desaprobar gasto en el sistema',
                                         str_id: 'expenses_5',
                                         module_name: 'Gastos'
                                     },
                                     # Privilegios de Trabajos
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo trabajo en el sistema',
                                         str_id: 'job_1',
                                         module_name: 'Trabajos'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar trabajo en el sistema',
                                         str_id: 'job_2',
                                         module_name: 'Trabajos'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar trabajo del sistema',
                                         str_id: 'job_3',
                                         module_name: 'Trabajos'
                                     },
                                     #40
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar trabajos del sistema',
                                         str_id: 'job_4',
                                         module_name: 'Trabajos'
                                     },
                                     # Privilegios de Archivos
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar los archivos y entrar a cada uno',
                                         str_id: 'file_1',
                                         module_name: 'Archivos'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Crear un nuevo archivo en el sistema',
                                         str_id: 'file_2',
                                         module_name: 'Archivos'
                                     },
                                     {
                                         name: 'Editar',
                                         description: 'Editar archivo en el sistema',
                                         str_id: 'file_3',
                                         module_name: 'Archivos'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Eliminar archivo del sistema',
                                         str_id: 'file_4',
                                         module_name: 'Archivos'
                                     },
                                     # Privilegios nuevos sin orden
                                     {
                                         name: 'Des/activar',
                                         description: 'Aprobar / Desaprobar facturación de gasto en el sistema',
                                         str_id: 'expenses_6',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Des/activar',
                                         description: 'Activar / Desactivar proyecto en el sistema',
                                         str_id: 'project_5',
                                         module_name: 'Proyectos'
                                     },
                                     {
                                         name: 'Estatus',
                                         description: 'Consultar estatus de bitácora en el sistema',
                                         str_id: 'blog_6',
                                         module_name: 'Bitácoras'
                                     },
                                     {
                                         name: 'Estatus Aprobado',
                                         description: 'Consultar estatus de aprobado de gasto en el sistema',
                                         str_id: 'expenses_7',
                                         module_name: 'Gastos'
                                     },
                                     {
                                         name: 'Estatus Facturado',
                                         description: 'Consultar estatus de facturado de gasto en el sistema',
                                         str_id: 'expenses_8',
                                         module_name: 'Gastos'
                                     },
                                     #50
                                     {
                                         name: 'Estatus',
                                         description: 'Consultar estatus de proyecto en el sistema',
                                         str_id: 'project_6',
                                         module_name: 'Proyectos'
                                     },
                                     {
                                         name: 'Estatus',
                                         description: 'Consultar estatus de usuario en el sistema',
                                         str_id: 'user_6',
                                         module_name: 'Usuarios'
                                     },
                                     # Privilegios de Usuarios-Proyectos
                                     {
                                         name: 'Consultar',
                                         description: 'Consultar usuario(s) asignados a un proyecto',
                                         str_id: 'userproject_1',
                                         module_name: 'Usuarios-Proyecto'
                                     },
                                     {
                                         name: 'Crear',
                                         description: 'Asignar usuario(s) a un proyecto',
                                         str_id: 'userproject_2',
                                         module_name: 'Usuarios-Proyecto'
                                     },
                                     {
                                         name: 'Eliminar',
                                         description: 'Quitar usuario(s) a un proyecto',
                                         str_id: 'userproject_3',
                                         module_name: 'Usuarios-Proyecto'
                                     },
                                     {
                                         name: 'Consultar Proyectos',
                                         description: 'Consultar todos los proyectos sin importar si el usuario esta asignado.',
                                         str_id: 'project_7',
                                         module_name: 'Proyectos'
                                     }

                                 ]
  )
end