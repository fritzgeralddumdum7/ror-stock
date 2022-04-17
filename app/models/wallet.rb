class Wallet < ApplicationRecord
  validate :validate_stock
  validate :validate_presence_of_qty
  validate :validate_qty

  belongs_to :user, optional: true
  belongs_to :stock

  def validate_stock
    if stock.nil?
      return errors.add(:stock_id, 'Please select a stock.')
    end
  end

  def validate_presence_of_qty
    if qty.nil?
      return errors.add(:qty, 'Quantity is required.')
    end
  end

  def validate_qty
    if stock.present? && !qty.nil?
      if qty > stock.qty && @@action_type == 'BUY'
        return errors.add(:qty, "Invalid Quantity. Remaining stock shares for #{stock.name} is #{stock.qty}.")
      else
        if stock.wallets.present?
          if @@action_type == 'SELL' && qty > stock.wallets[0].qty
            return errors.add(:qty, "Invalid Quantity. Your remaining stock shares for #{stock.name} is only #{stock.wallets[0].qty}.")
          end
        elsif @@action_type == 'SELL'
          return errors.add(:stock_id, "You dont have shares to #{stock.name}.")
        end
      end
    end
  end

  def set_action_type(action)
    @@action_type = action
  end
end
