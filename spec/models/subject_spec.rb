require 'rails_helper'

RSpec.describe Subject do
  it 'is valid with valid attributes' do
    subject = build(:subject)
    expect(subject).to be_valid
  end

  it 'is not valid with empty title' do
    subject = build(:subject, title: nil)
    expect(subject).not_to be_valid
  end

  it 'is not valid when title is taken' do
    subject1 = create(:subject)
    subject2 = build(:subject, title: subject1.title)

    expect(subject2).not_to be_valid
  end

  it 'is not valid without associated user' do
    subject = build(:subject, user: nil)
    expect(subject).not_to be_valid
  end
end
