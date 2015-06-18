require 'spec_helper'

describe Meetup do

  it 'has a name' do
    meetup = Meetup.create(name: "Launch Pals", description: "Come hang with Launchers", location: "33 Harrison Ave., Boston, MA")
    expect(meetup.name).to eq("Launch Pals")
  end

  it 'has a description' do
    meetup = Meetup.create(name: "Launch Pals", description: "Come hang with Launchers", location: "33 Harrison Ave., Boston, MA")
    expect(meetup.description).to eq("Come hang with Launchers")
  end

  it 'has a location' do
    meetup = Meetup.create(name: "Launch Pals", description: "Come hang with Launchers", location: "33 Harrison Ave., Boston, MA")
    expect(meetup.location).to eq("33 Harrison Ave., Boston, MA")
  end

  it "has users" do
    new_user = User.create(provider: "Github", uid: "14324321423", username: "Nora", email: "nora.delaney@gmail.com", avatar_url: "www.something.com")
    second_user = User.create(provider: "Github", uid: "1234", username: "Tom", email: "tom@tom.com", avatar_url: "www.tom.com")
    new_meetup = Meetup.create(name: "Launch Pals", description: "Come hang with Launchers", location: "33 Harrison Ave., Boston, MA")
    Membership.create(user_id: new_user.id, meetup_id: new_meetup.id)
    Membership.create(user_id: second_user.id, meetup_id: new_meetup.id)

    expect(new_meetup.users.first).to eq(new_user)
    expect(new_meetup.users.first.username).to eq("Nora")
    expect(new_meetup.users.last.username).to eq("Tom")
  end

end
