require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'phone number format validation' do

    m1 = Member.new(fname: 'Test', lname: 'Member', phone_number: '1234567890', membership_type_id: 1)
    m2 = Member.new(fname: 'Test', lname: 'Member', phone_number: '123-45-67890', membership_type_id: 1)
    m3 = Member.new(fname: 'Test', lname: 'Member', phone_number: '123', membership_type_id: 1)
    m4 = Member.new(fname: 'Test', lname: 'Member', phone_number: '999-999-09090', membership_type_id: 1)

    assert_not m1.save
    assert_not m2.save
    assert_not m3.save
    assert_not m4.save
  end

end
