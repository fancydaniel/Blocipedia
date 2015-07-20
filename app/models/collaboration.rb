class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  validates_uniqueness_of :user_id, scope: :wiki_id, message: "is already a collaborator."
  validate :user_not_owner

  delegate :email, to: :user

  def user_not_owner
    if user == wiki.user
      errors.add(:user, "can't be owner.")
    end
  end
end