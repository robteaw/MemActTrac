class Member < ApplicationRecord
  belongs_to :membership_type
  has_many :calls, :dependent => :destroy

  validates :phone_number, format: {
      with: /\(\d{3}\)\s\d{3}-\d{4}/, message: 'Please use the format "(xxx) xxx-xxxx"'
  }
  validates_length_of :phone_number, maximum: 14, message: 'Please use the format "(xxx) xxx-xxxx"'

  # Business rules dictate that members are to be called 2 weeks and 6 months
  # after they sign up for a full membership.  This function adds those records
  # to the database as soon as a new member is entered into the database,
  # including via the convert_to_member functionality in the Prospects Module
  after_create :generate_checkin_calls

  def generate_checkin_calls
    #to side step the employee constraint in the calls table
    tbd_employee = Employee.find(999)

    first_check_in_due_date = self.created_at + 2.weeks
    second_check_in_due_date = self.created_at + 6.months

    first_check_in_call = Call.create(member: self, employee: tbd_employee, due_date: first_check_in_due_date)
    first_check_in_call.save!
    second_check_in_call = Call.create(member: self, employee: tbd_employee, due_date: second_check_in_due_date)
    second_check_in_call.save!

    p = Prospect.find_by(fname: self.fname, lname: self.lname)
    if !p.nil?
      p.signed_up = 1
      p.showed=1
      p.save!

    end


  end


  def full_name
    #this function is simply to make working with
    # member views easier
    get_full_name = self.fname + ' ' + self.lname
    return get_full_name
  end

end
