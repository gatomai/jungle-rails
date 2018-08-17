class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :send_email_to_customer

  def send_email_to_customer
    UserMailer.order_confirmation(self).deliver
  end


end
