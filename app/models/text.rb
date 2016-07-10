class Text
  include ActiveAttr::Model

  attribute :phone_number
  attribute :message

  attr_accessor :phone_number, :message
  validates :phone_number, presence: true, format: { with: /\d{10}/, message: "must be 10 continuous digits including the area code, e.g. 1234567890" }
  validates :message, presence: true
end