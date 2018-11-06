class Contract < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  validates :start_date,  presence: true
  validates :end_date,  presence: true
  validate :dates

  def dates
    if start_date < Date.today || end_date < start_date
      errors.add(:start_date, "invalid dates")
    end
  end
end
