class Wiki < ActiveRecord::Base
  belongs_to :user 
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  default_scope { order('updated_at DESC') }

  def self.visible_to(user)
    if user && user.admin? 
      all
    elsif user && user.premium? || user.standard? # || user.include?
      where("user_id = ? OR private = ?", user.id, false)
    else
      where(private: false)          
    end
  end

  def can_show?
    if wiki.public?
      current_user
    else
      'admin' || wiki.user_id # || user.include?
    end
  end

  def can_edit?(wiki)
    if wiki.public?
      current_user || admin? # || user.include?
    else
      wiki.user_id
    end
  end

  def owns?(wiki)
    true if self.id == wiki.user_id
  end

  def can_destroy?(wiki)
    true if owns?(wiki) || admin?
  end

  def role_name
    User.user_roles.key(self.role)
  end

  def self.user_roles
    USER_ROLES
  end

end
