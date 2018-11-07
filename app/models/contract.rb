class Contract < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  validates :start_date,  presence: true
  validates :end_date,  presence: true
  validate :dates
  validate :booking_period_not_overlapped

  def dates
    if start_date < Date.today || end_date < start_date
      errors.add(:start_date, "invalid dates")
    end
  end

  # def cannot_overlap_another_contract
  #   binding.pry
  #   contracts = Contract.joins(:pet).where(pets: {id: self.pet.id})
  #   dates = contracts.map { |c| (c.start_date..c.end_date) }
  #   if dates.include? start_date || end_date
  #     return false
  #   else
  #     return true
  #   end
  # end

  # def unbooked_dates(date, pet)
  #   unbooked = []
  #   booked_dates = Contract.
  # end
  private
    def booking_period_not_overlapped
      contracts = Contract.joins(:pet).where(pets: {id: self.pet.id})
      unless contracts.where(
        '(start_date <= ? AND end_date >= ?) OR (start_date >= ? AND start_date <= ?)',
        start_date, start_date,
        start_date, end_date
      ).empty?
        errors.add(:start_date, 'Invalid period.')
      end
    end
  # def cannot_overlap_another_contract
  #   binding.pry
  #   if overlap_another_contract?
  #     errors[:base] << "This appointment overlaps with another one."
  #   end
  # end
end
