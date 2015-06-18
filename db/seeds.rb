# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create(name: "Paunch Pals", description: "Come eat with Launchers", location: "33 Harrison Ave., Boston, MA")
Meetup.create(name: "Asparagus Fans", description: "Come talk about asparagus", location: "33 Harrison Ave., Boston, MA")
User.create(provider: "GitHub", uid: "fdafdaf", username:"test", email:"test@test.com", avatar_url: "www.whater.com")
