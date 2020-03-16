class Coupon < ApplicationRecord
  scope :active, -> { where(is_active: true) }

  def self.applicable_coupons(user)
    active.each do |coupon|
      constraints = coupon.constraints
      operator = constraints[:operator]
      columns = operator ? constraints.keys : constraints.keys
      expression = []
      columns.each do |column|
        expression .push user.send(column) == constraints[column]
        break unless operator
      end
      return coupon if eval(expression.join(self.operator_equivalent(operator)))
    end
    # if no applicable coupons found then return nil
    nil
  end

  def self.operator_equivalent(operator)
    case operator
    when :and
      '&&'
    when :or
      '||'
    else
      ''
    end
  end
end
