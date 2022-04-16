class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  before_save :set_total_cost
  after_save :update_stock_qty

  validate :is_qty_valid

  private

  def set_total_cost
    self.total_cost = qty * stock.unit_price
  end

  def update_stock_qty
    if action_type == 'BUY'
      stock.update(qty: stock.qty - qty)
    else
      stock.update(qty: stock.qty + qty)
    end
  end

  def is_qty_valid
    if action_type == 'BUY' && qty > stock.qty
      errors.add(:qty, 'Invalid qty!')
    end
  end
end
