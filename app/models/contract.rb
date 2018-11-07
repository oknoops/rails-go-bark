class Contract < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  validates :start_date,  presence: true
  validates :end_date,  presence: true
  validate :dates
  validate :cannot_overlap_another_contract

  def dates
    if start_date < Date.today || end_date < start_date
      errors.add(:start_date, "invalid dates")
    end
  end

  def overlap_another_contract?
    contracts = Contract.joins(:pet).where(pets: {id: self.pet.id})
    dates = contracts.map { |c| (c.start_date..c.end_date) }
    if dates.include? start_date || end_date
      return false
    else
      return true
    end
  end

  def cannot_overlap_another_contract
    if overlap_another_contract?
      errors[:base] << "This appointment overlaps with another one."
    end
  end
end
