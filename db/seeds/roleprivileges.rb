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