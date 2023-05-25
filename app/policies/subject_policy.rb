class SubjectPolicy < ApplicationPolicy
  attr_reader :user, :subject

  def initialize(user, subject)
    @user = user
    @subject = subject
  end

  def update?
    user == subject.user
  end

  def destroy?
    update?
  end
end
