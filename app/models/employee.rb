class Employee < ApplicationRecord
  has_many :calls

  def soft_delete
    self.deleted_at = Date.today
    self.save!
  end

  def reactivate
    self.deleted_at = nil
    self.save!
  end

  def full_name
    full_name = self.fname + ' ' + self.lname
    if self.deleted_at != nil
      full_name = full_name + ' (INACTIVE)'
    end
    return full_name
  end

end
