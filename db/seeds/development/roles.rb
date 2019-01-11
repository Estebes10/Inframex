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