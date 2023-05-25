require 'rails_helper'

RSpec.describe 'Subjects' do
  before do
    driven_by(:rack_test)
  end

  it 'creates subject' do
    user = create(:user)
    subject = build(:subject)

    login_as user, scope: :user

    visit root_path

    expect(Subject.all.count).to eq(0)

    click_link 'Subjects'
    click_link 'New Subject'

    fill_in 'Title', with: subject.title
    click_button 'Create Subject'

    expect(page).to have_content('Subject was successfully created.')
    expect(page).to have_content(subject.title)
    expect(Subject.all.count).to eq(1)
  end

  it 'updates subject' do
    user = create(:user)
    create(:subject, user: user)

    login_as user, scope: :user

    visit root_path

    expect(Subject.all.count).to eq(1)

    click_link 'Subjects'
    click_link 'Edit'
    fill_in 'Title', with: 'New Title'
    click_button 'Update Subject'

    expect(page).to have_content('Subject was successfully updated.')
    expect(Subject.all.count).to eq(1)
    expect(Subject.first.title).to eq('New Title')
  end

  it 'destroys subject' do
    user = create(:user)
    create(:subject, user: user)

    login_as user, scope: :user

    visit root_path

    expect(Subject.all.count).to eq(1)

    click_link 'Subjects'
    click_link 'Destroy'

    expect(page).to have_content('Subject was successfully destroyed.')
    expect(Subject.all.count).to eq(0)
  end
end
