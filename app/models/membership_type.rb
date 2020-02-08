class MembershipType < ApplicationRecord
  has_many :members
  has_many :prospects

  def soft_delete
    self.deleted_at = Date.today
    self.save!
  end

  def reactivate
    self.deleted_at = nil
    self.save!
  end

end
