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
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 12
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 13
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 14
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 15
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 16
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 17
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 18
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 19
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 20
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 21
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 22
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 23
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 24
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 25
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 26
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 27
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 28
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 29
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 30
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 31
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 32
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 33
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 34
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 35
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 36
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 37
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 38
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 39
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 40
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 41
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 42
                                              },
                                              {
                                                  role_id: 1,
                                                  privilege_id: 43
                                              },
                                              # "Administrador de proyectos" privileges
                                              {
                                                  role_id: 2,
                                                  privilege_id: 18
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 19
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 20
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 21
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 22
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 23
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 24
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 25
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 26
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 27
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 28
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 29
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 30
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 31
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 32
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 33
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 34
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 35
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 36
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 37
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 38
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 39
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 40
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 41
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 42
                                              },
                                              {
                                                  role_id: 2,
                                                  privilege_id: 43
                                              },
                                              # "Supervisor de proyecto" privileges
                                              {
                                                  role_id: 3,
                                                  privilege_id: 18
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 19
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 20
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 22
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 23
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 24
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 25
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 27
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 28
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 32
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 33
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 34
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 36
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 37
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 38
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 39
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 40
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 41
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 42
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 43
                                              },
                                              # "Cliente" privileges
                                              {
                                                  role_id: 3,
                                                  privilege_id: 18
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 23
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 28
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 32
                                              },
                                              {
                                                  role_id: 3,
                                                  privilege_id: 37
                                              }
                                          ]
  )
end