class Ordering
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  extend ActiveModel::Naming

  attr_accessor :order_pairs

  def save
    order_pairs.each do |pair|
      Task.find(pair.first).update_attribute(:order, pair.last.to_i)
    end
  end
end
