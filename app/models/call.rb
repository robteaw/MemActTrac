class Call < ApplicationRecord
  belongs_to :member
  belongs_to :employee
  
  def record_call(emp_id, outcome)
    self.update(employee: emp_id, outcome: outcome, completed: Date.today)
  end

  def is_completed
    if self.completed.nil?
      return "Not completed"
    else
      return "Completed"
    end
  end

  def outcomes
    return ["Left Message", "Spoke to Someone"]
  end

end
