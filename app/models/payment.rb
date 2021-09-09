class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method

  def close!
    ActiveRecord::Base.transaction do
      complete
      order.complete
    end
  end

  def complete
      update_attribute(:state, "completed")
  end
end
