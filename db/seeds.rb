# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!([{email: "karasubaironowatashi@gmail.com",
               password: "supermario88",
               password_confirmation: "supermario88",
               reset_password_token: nil,
                reset_password_sent_at: nil,
                 remember_created_at: nil,
                  sign_in_count: 1,
                   current_sign_in_at: "2016-04-01 19:59:09",
                    last_sign_in_at: "2016-04-01 19:59:09",
                     current_sign_in_ip: "127.0.0.1",
                      last_sign_in_ip: "127.0.0.1",
                       name: "Maria", 
                       avatar_file_name: nil,
                        avatar_content_type: nil, 
                        avatar_file_size: nil, 
                        avatar_updated_at: nil,
                         points: nil, 
                         purchase: nil,
                          herotype: nil, 
                          role: "admin"}
])
