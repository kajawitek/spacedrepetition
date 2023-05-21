require 'rails_helper'

RSpec.describe 'Subjects' do
  before do
    driven_by(:rack_test)
  end

  it 'creates subject' do
    user = create(:user)
    subject = build(:subject)

    visit root_path
    click_link 'Log In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')

    expect(Subject.all.count).to eq(0)

    click_link 'Subjects'
    click_link 'New Subject'

    fill_in 'Title', with: subject.title

    click_button 'Create Subject'

    expect(page).to have_content('Subject was successfully created.')
    expect(Subject.all.count).to eq(1)
  end

  it 'updates subject' do
    user = create(:user)
    subject = create(:subject)

    visit root_path
    click_link 'Log In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')

    expect(Subject.all.count).to eq(1)

    click_link 'Subjects'
    click_link 'Edit'

    fill_in 'Title', with: 'New Title'

    click_button 'Update Subject'

    expect(page).to have_content('Subject was successfully updated.')
    expect(Subject.all.count).to eq(1)
    expect(Subject.first.title).to eq('New Title')
  end
end
