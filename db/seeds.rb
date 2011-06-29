puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT ADMIN LOGIN'
admin = Admin.create! :name => 'root', :email => "root@gdx.org", :password => 'please', :password_confirmation => 'please'
puts 'New admin created: ' << admin.name
