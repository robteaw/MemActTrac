class Prospect < ApplicationRecord
  belongs_to :membership_type
  belongs_to :class_time
  before_create :set_defaults


  def convert_to_member
    self.signed_up = true
  end

  def set_defaults
    self.showed=0
    self.signed_up=0
  end

  def full_name
    #this function is to make the prospect views easier
    # to work with when displaying records
    get_full_name = self.fname + ' ' + self.lname
    return get_full_name
  end

  def did_show
    self.showed=1
    self.save!
  end

  def showed_status
    if !self.showed
      return "Hasn't Shown"
    else
      return "Showed"
    end
  end

  def human_bool_show
    if !self.showed
      return 'No '
    else
      return 'Yes'
    end
  end

  def human_bool_su
    if !self.signed_up
      return 'No '
    else
      return 'Yes'
    end
  end


end
