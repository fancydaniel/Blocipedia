class Wiki < ActiveRecord::Base
  has_many :users

  def can_edit?(wiki)
    @user || admin?
  end

  def can_destroy?(wiki)
    true if owns?(wiki) || admin?
  end

  def owns?(wiki)
    true if self.id == wiki.user_id
  end

  def admin?
    true if self.role_name == :admin
  end

  def role_name
    User.user_roles.key(self.role)
  end

  def self.user_roles
    USER_ROLES
  end

end
