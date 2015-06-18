# require 'spec_helper'
#
# describe Membership do
#
#   it "has a user" do
#     new_user = User.create(provider: "Github", uid: "14324321423", username: "Nora", email: "nora.delaney@gmail.com", avatar_url: "www.something.com")
#     new_meetup = Meetup.create(name: "Launch Pals", description: "Come hang with Launchers", location: "33 Harrison Ave., Boston, MA")
#     Membership.create(user_id: new_user.id, meetup_id: new_meetup.id)
#
#     expect(Meetup.where().first.username.to eq("Nora"))
#   end
#
#   it "has a meetup" do
#   end
#
# end
