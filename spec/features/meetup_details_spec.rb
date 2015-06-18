require 'spec_helper'

feature 'User views meetups' do

  scenario 'user visits meetup show page' do
    meetup = Meetup.create(name: "Paunch Pals", description: "Come eat with Launchers", location: "33 Harrison Ave., Boston, MA")
    visit '/'

    click_on meetup.name

    expect(page).to have_content(meetup.name)
    expect(page).to have_content(meetup.description)
    expect(page).to have_content(meetup.location)
  end

end
